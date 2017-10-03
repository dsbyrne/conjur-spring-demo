#!/usr/bin/env bash
set -eo pipefail

# Load policy and populate secret values
conjur policy load --as-group security_admin policy/demo-app.yml
conjur variable values add demo-app/api-key "$(openssl rand -hex 20)"

# Create a new host identity to run our application and conjurize the local machine
# token="`conjur hostfactory token create demo-app | jq -r ".[0].token"`"
# conjur hostfactory host create $token dynamic-host-$(openssl rand -hex 2) | conjurize | sudo sh

# Build demo application jar file
mvn package

echo -e "\n\n"
echo "Setup complete."
echo "You may now run \"java -jar target/`ls target | grep '.jar$'`\"."
