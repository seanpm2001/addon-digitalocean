defmodule DigitalOceanConnector.DigitalOcean.OauthMock do
  def post!(url, body, headers) do
    response_body = """
    {
      "access_token": "547cac21118ae7",
      "token_type": "bearer",
      "expires_in": 2592000,
      "refresh_token": "00a3aae641658d",
      "scope": "read write",
      "info": {
        "name": "Sammy the Shark",
        "email":"sammy@digitalocean.com",
        "uuid":"e028b1b918853eca7fba208a9d7e9d29a6e93c57"
      }
    }
    """
    %HTTPoison.Response{body: response_body}
  end

  def get!("https://api.digitalocean.com/v2/droplets", headers) do
    response_body = """
      {"droplets":[{"id":3164444,"name":"example.com","memory":512,"vcpus":1,"disk":20,"locked":false,"status":"active","kernel":{"id":2233,"name":"Ubuntu 14.04 x64 vmlinuz-3.13.0-37-generic","version":"3.13.0-37-generic"},"created_at":"2014-11-14T16:29:21Z","features":["backups","ipv6","virtio"],"backup_ids":[7938002],"snapshot_ids":[],"image":{"id":6918990,"name":"14.04 x64","distribution":"Ubuntu","slug":"ubuntu-14-04-x64","public":true,"regions":["nyc1","ams1","sfo1","nyc2","ams2","sgp1","lon1","nyc3","ams3","nyc3"],"created_at":"2014-10-17T20:24:33Z","type":"snapshot","min_disk_size":20,"size_gigabytes":2.34},"volumes":[],"size":{},"size_slug":"512mb","networks":{"v4":[{"ip_address":"104.236.32.182","netmask":"255.255.192.0","gateway":"104.236.0.1","type":"public"}],"v6":[{"ip_address":"2604:A880:0800:0010:0000:0000:02DD:4001","netmask":64,"gateway":"2604:A880:0800:0010:0000:0000:0000:0001","type":"public"}]},"region":{"name":"New York 3","slug":"nyc3","sizes":[],"features":["virtio","private_networking","backups","ipv6","metadata"],"available":null},"tags":[]}],"links":{"pages":{"last":"https://api.digitalocean.com/v2/droplets?page=3&per_page=1","next":"https://api.digitalocean.com/v2/droplets?page=2&per_page=1"}},"meta":{"total":3}}
    """
    %HTTPoison.Response{body: response_body}
  end

  def get!("https://api.digitalocean.com/v2/droplets/" <> id, headers) do
    response_body = """
      {"droplet":{"id":3164494,"name":"example.com","memory":512,"vcpus":1,"disk":20,"locked":false,"status":"active","kernel":{"id":2233,"name":"Ubuntu 14.04 x64 vmlinuz-3.13.0-37-generic","version":"3.13.0-37-generic"},"created_at":"2014-11-14T16:36:31Z","features":["ipv6","virtio"],"backup_ids":[],"snapshot_ids":[7938206],"image":{"id":6918990,"name":"14.04 x64","distribution":"Ubuntu","slug":"ubuntu-14-04-x64","public":true,"regions":["nyc1","ams1","sfo1","nyc2","ams2","sgp1","lon1","nyc3","ams3","nyc3"],"created_at":"2014-10-17T20:24:33Z","type":"snapshot","min_disk_size":20,"size_gigabytes":2.34},"volumes":[],"size":{},"size_slug":"512mb","networks":{"v4":[{"ip_address":"104.131.186.241","netmask":"255.255.240.0","gateway":"104.131.176.1","type":"public"}],"v6":[{"ip_address":"2604:A880:0800:0010:0000:0000:031D:2001","netmask":64,"gateway":"2604:A880:0800:0010:0000:0000:0000:0001","type":"public"}]},"region":{"name":"New York 3","slug":"nyc3","sizes":["32gb","16gb","2gb","1gb","4gb","8gb","512mb","64gb","48gb"],"features":["virtio","private_networking","backups","ipv6","metadata"],"available":true},"tags":[]}}
    """
    %HTTPoison.Response{body: response_body}
  end

  # def get!(url, headers) do
  #   raise "Write a DigitalOcean.OauthMock for: #{url}"
  # end
end
