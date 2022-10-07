import os

envs = [{
    "browser": "Chrome",
},
    {
    "browser": "Safari",
},
    {
    "browser": "Firefox",
}]


def get_test_caps(i):
    return envs[int(i)]
