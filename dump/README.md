# .github


## Pipeline workflow

### Development (pull_request main)
Lint Code --> Tag Image --> Test Image --> Publish Image --> Deploy Development --> Review --> Close --> Destroy Development

### Staging (push main)
Deploy Staging --> Review --> Destroy Staging --> Release

### Production (release v*.*.*)
Tag Image --> Review --> Deploy Production
