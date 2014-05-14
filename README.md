# Dockerfile for [clarkda/action-jackson](https://github.com/clarkda/action-jackson)
* This dockerfile installs ssh, mongodb, nodejs, subervisor, and action-jackson
* It then starts ssh and action-jackson under supervisord

## Usage
```
docker build -t jimshoe/action-jackson .
```
```
docker run -d -p 80:3000 jimshoe/action_jackson
```
