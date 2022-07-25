*** Variables ***
&{PARALLEL_CAPS_1}      name=parallel test    build=browserstack-build-1    browser=Chrome    browser_version=latest    os=Windows    os_version=10
&{PARALLEL_CAPS_2}      name=parallel test    build=browserstack-build-1    browser=Safari    browser_version=latest    os=OS X    os_version=Big Sur
&{PARALLEL_CAPS_3}      name=parallel test    build=browserstack-build-1    device=Samsung Galaxy S22    os_version=12    real_mobile=true
