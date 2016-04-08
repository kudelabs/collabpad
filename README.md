# About this Hackpad
This hackpad to be changed for our own use.

# Installation

Add ENVs below

```bash
export SCALA_HOME="/usr/share/scala"
export SCALA_LIBRARY_JAR="$SCALA_HOME/lib/scala-library.jar"
export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.71-2.b15.el7_2.x86_64/jre"
```

# Set up with Apache

For SSL should add below to apache config

```bash
RequestHeader set X-Scheme 'https'
```

# Config for hackpad


useHttpsUrls = true
hidePorts = true

We need hide ports when we turn on SSL and using nginx/apache to proxy via no-SSL, below is the code and why we need this.
```javascript
if (appjet.config.listenSecurePort != "443" && !appjet.config.hidePorts) {
  h = (h + ":" + appjet.config.listenSecurePort);
}
```
