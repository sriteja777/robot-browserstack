import os
from selenium import webdriver

options = webdriver.ChromeOptions()

common_caps = {
    "userName" : "BROWSERSTACK_USERNAME",
    "accessKey" : "BROWSERSTACK_ACCESS_KEY",
    "buildName" : "browserstack-build-1",
    "debug" : "true"
}

envs = [{
    "os" : "Windows",
    "osVersion" : "10",
    "browserName" : "Chrome",
    "browserVersion" : "latest"
},
{
    "os" : "OS X",
    "osVersion" : "Big Sur",
    "browserName" : "Safari",
    "browserVersion" : "latest"
},
{
    "deviceName" : "Samsung Galaxy S22",
    "osVersion" : "12",
    "browserName" : "Chrome"
}]

def combine_caps(i, session_name):

    username = os.environ.get("BROWSERSTACK_USERNAME")
    accesskey = os.environ.get("BROWSERSTACK_ACCESS_KEY")
    if username != None and accesskey != None:
        common_caps["userName"] = username
        common_caps["accessKey"] = accesskey

    x = int(i)
    envs[x].update(common_caps)
    envs[x].update({"sessionName" : "BStack Demo - " + session_name})

    if session_name == "Local Test":
        envs[x].update({"local" : "true"})

    if 'browserName' in envs[x]:
        options.set_capability("browserName", envs[x]['browserName'])
    if 'browserVersion' in envs[x]:
        options.set_capability("browserVersion", envs[x]['browserVersion'])

    options.set_capability("bstack:options", envs[x])
    return options
