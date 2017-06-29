# conjur-spring-demo
Demonstrates a Spring application fetching secrets from Conjur via [spring-cloud-conjur](https://github.com/dsbyrne/spring-cloud-conjur).

## Running the demo
1. Install the [Conjur API for Java](https://github.com/conjurinc/api-java) with `mvn install`
2. Install the [Conjur cloud config for Spring](https://github.com/dsbyrne/spring-cloud-conjur) with `mvn install`.
3. Run `setup.sh`

## setup.sh
This script will load Conjur policy and build the demo application. It expects the following:
1. You have the [Conjur CLI](https://github.com/conjurinc/cli-ruby) installed.
2. The CLI has already been initialized to a valid Conjur server.
3. A user `demo` exists as `security_admin`, with password `demo`.

After being successfully executed, you will have the following:
1. The [`demo-app.yml`](policy/demo-app.yml) policy loaded
2. A host factory token generated
3. A new host identity created using the above host factory token
4. You will be logged in as the previous host identity (try `conjur authn whoami`)
5. The [`api-key`](policy/demo-app.yml#L7) variable from the policy will be populated with a dummy value
6. The demo-app Spring application will be built, creating a jar file in the `target` directory.

You can now run the jar file which will fetch a secret from Conjur. Check out the [single line of code](src/main/java/com/example/demo/DemoApplication.java#L15) which makes this happen. After running the script, log in to the Conjur UI and view the audit data.