'use strict';


$( document).ready(function(){
  var recorder;
  var stream;
  var counter=1;
  var chunks = [];
  var media;
  $("#gUMbtn").click(function(){
    var mv = $('#mediaVideo');
    var mediaOptions = {
      video: {
        tag: 'video',
        type: 'video/webm',
        ext: '.mp4',
        gUM: {video: true, audio: true}
      },
      audio: {
        tag: 'audio',
        type: 'audio/ogg',
        ext: '.ogg',
        gUM: {audio: true}
      }
    };
    media = mediaOptions.audio;
    navigator.mediaDevices.getUserMedia(media.gUM).then(function(_stream) {
    stream = _stream;
    $('#gUMArea').hide();
    $('#btns').show();
    $("#start").removeAttr('disabled');
    recorder = new MediaRecorder(stream);
    recorder.ondataavailable = function(e) {
      chunks.push(e.data);
      if(recorder.state == 'inactive')  makeLink();
    };
  })
});

  $("#start").click(function(){
    $("#start").attr("disabled", true);
    $("#stop").removeAttr('disabled');
    var chunks = [];
    recorder.start();
  });



  $("#stop").click(function(){
    $("#stop").attr("disabled", true);
    recorder.stop();
    $("#start").removeAttr('disabled');
  });

  function makeLink(){
    var blob = new Blob(chunks, {type: media.type })
        , url = URL.createObjectURL(blob)
        , li = document.createElement('li')
        , mt = document.createElement(media.tag)
        , hf = document.createElement('a')
        ;
    mt.controls = true;
    mt.src = url;
    hf.href = url;
    hf.download = '${counter++}${media.ext}';
    hf.innerHTML = 'Save';
    li.appendChild(mt);
    li.appendChild(hf);
    ul.appendChild(li);
    debugger

  }

});


