require "kemal"

Kemal.config.powered_by_header = false

get "/:name" do |env|
  name = env.params.url["name"]
  render "src/views/hello.ecr"
end

Kemal.run
