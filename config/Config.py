import os
from selenium import webdriver

options = webdriver.ChromeOptions()

browsers = ["Chrome", "Safari", "Chrome"]

common_caps = {
    "userName" : "BROWSERSTACK_USERNAME",
    "accessKey" : "BROWSERSTACK_ACCESS_KEY",
    "buildName" : "browserstack-build-1",
    "debug" : "true"
}

envs = [{
    "os" : "Windows",
    "osVersion" : "10",
},
{
    "os" : "OS X",
    "osVersion" : "Big Sur",
},
{
    "deviceName" : "Samsung Galaxy S22",
    "osVersion" : "12"
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
    
    options.set_capability("browserName", browsers[x])
    options.set_capability("browserVersion", "latest")

    options.set_capability("bstack:options", envs[x])
    return options
