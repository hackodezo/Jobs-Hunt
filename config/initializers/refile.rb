# config/initializers/refile.rb
require "refile/s3"

aws = {
  access_key_id: "AKIAIIVBJGRR64O5DTHQ",
  secret_access_key: "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",
  region: "ap-southeast-1",
  bucket: "jobshunt",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)