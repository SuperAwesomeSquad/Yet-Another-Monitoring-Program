require 'spec_helper'

describe PingWorker do
  it "Should respond to perform"
  it "Should file an unsuccessful PingResult upon failure"
  it "Should file a successful PingResult upon success"
  it "Should catch an exception with the ping itself"
end
