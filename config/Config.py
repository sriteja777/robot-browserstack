import os

common_caps = {
    "browserstack.user" : "BROWSERSTACK_USERNAME",
    "browserstack.key" : "BROWSERSTACK_ACCESS_KEY",
    "build" : "browserstack-build-1",
    "browserstack.debug" : "true"
}

envs = [{
    "os" : "Windows",
    "os_version" : "10",
    "browser" : "Chrome",
    "browser_version" : "latest"
},
{
    "os" : "OS X",
    "os_version" : "Big Sur",
    "browser" : "Safari",
    "browser_version" : "latest"
},
{
    "device" : "Samsung Galaxy S22",
    "os_version" : "12"
}]

def combine_caps(i):

    username = os.environ.get("BROWSERSTACK_USERNAME")
    accesskey = os.environ.get("BROWSERSTACK_ACCESS_KEY")
    if username != None and accesskey != None:
        common_caps["browserstack.user"] = username
        common_caps["browserstack.key"] = accesskey

    x = int(i)
    envs[x].update(common_caps)
    return envs[x]
