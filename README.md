# tod_list_managmant

Tod list managmant - Приложение для менеджента команды и удобного управление командой и прогресса.

The architectural solution that is being built:  
- low coherence of the code (makes it easier to make changes);  
- separation of code responsibilities;  
- logical uniqueness and low entry threshold;  
- testability (you can check the correct operation of individual parts).  


DI (dependency injection)
Injectable
Navigation with AutoRoute
SOLID
Clean Architecture


## Content
The Flutter app contains:
- A [`Flutter`](https://flutter.dev/) application.
- Built-in support for 3 [`flavors`](https://docs.flutter.dev/deployment/flavors) - `dev`, `qa` and `prod`.
- A [`reactive base architecture`](#architecture) for your application.
- [`Riverpod`](https://riverpod.dev/) along with [`state_notifier`](https://pub.dev/packages/state_notifier) for state management.
- [`Drift`](https://drift.simonbinder.eu/) as local database for storage.
- [`Dio`](https://github.com/flutterchina/dio) for making API calls.
- [`Freezed`](https://pub.dev/packages/freezed) for data class functionality.
- [`Get It`](https://pub.dev/packages/get_it) for dependency injection.
- [`Flutter Lints`](https://pub.dev/packages/flutter_lints) for linting.
- [`derry`](https://pub.dev/packages/derry) for script management.
- [`mason`](https://pub.dev/packages/mason_cli) for templating.
- [`sonarqube`](https://docs.sonarqube.org/latest/) for code inspection.


## Continuous Integration and Deployment
The Flutter app comes with built-in support for CI/CD using Github Actions.

### CI
The [`CI`](.github/workflows/ci.yml) workflow performs the following checks on every pull request:
- Lints the code with `flutter analyze`.
- Check formatting with `dart format`
- Runs tests using `flutter test`.
- Run golden test.
- Report code coverage and code quality using `sonarqube`.
- Build the android app.
- Build the ios app.

You can read the documentation about integrating `sonarqube` in you CI workflow [here](https://docs.sonarqube.org/latest/devops-platform-integration/github-integration/#analyzing-projects-with-github-actions).

### CD
The [`CD`](.github/workflows/cd.yml) workflow performs the following actions:
- Bump the build number by 1.
- Build a signed release apk.
- Upload apk to the app center.
- Upload apk as artifact to release tag.
- Build a signed iOS app.
- Upload ipa to testflight.
- Upload the ipa as an artifact to release the tag.
- Commit the updated version to git.

### .env files on CD
The CI and CD workflows grab the `.env` files from github secrets. The secrets are name `ENV_` followed by environment name.
So for dev the secret name is `ENV_DEV`, qa is `ENV_QA` and prod is `ENV_PROD`.
Convert your `.env` files with all the api keys populated to base64 strings and set them as secrets on github with the appropriate secret name.
You can learn more about github actions secrets [here](https://docs.github.com/en/actions/security-guides/encrypted-secrets).

### Android CD setup
For the android CD workflow to run, we need to perform the following setup steps:
- Follow these instructions to [generate an upload keystore](https://developer.android.com/studio/publish/app-signing#generate-key). Note down the `store password`, `key alias` and `key password`. You will need these in later steps.
- Use `openssl` to convert the `jks` file to `Base64`.
```shell
openssl base64 < flutter_app_keystore.jks | tr -d '\n' | tee flutter_app_keystore_encoded.txt
```
- Store the `base64` output on [`Github Secrets`](https://docs.github.com/en/actions/security-guides/encrypted-secrets) with the key name `KEYSTORE`.
- Save the `store password` in github secrets with the key name `RELEASE_STORE_PASSWORD`.
- Save the `key alias` in github secrets with the key name `RELEASE_KEY_ALIAS`.
- Save the `key password` in github secrets with the key name `RELEASE_KEY_PASSWORD`.
- [Create a distribution on app center](https://docs.microsoft.com/en-us/appcenter/distribution/) and get the upload key. You can get it from appcenter.ms/settings.
- Save the app center upload key on github secrets with key name `APP_CENTER_TOKEN`.


### IOS CD Setup
For the IOS job in the `cd.yml` to run, you first need to have a valid [Apple Developer Account](https://developer.apple.com/).If you don't have it yet, please create one before proceeding further

We will divide the guide into steps so that it is easier to understand

#### Step 1: Setup on the AppStore
- Register your `Bundle ID`. You can view the official Flutter guide [here](https://docs.flutter.dev/deployment/ios#register-a-bundle-id)
> CAUTION: Apple doesn't allow underscore in the bundle identifier. Read about valid identifiers [here](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleidentifier)
- Create an application on the AppStore Connect Portal. Check out the official guide [here](https://docs.flutter.dev/deployment/ios#create-an-application-record-on-app-store-connect)

#### Step 2: Getting a Distribution Certificate and Provisioning Profile
- Create a `Distribution Certificate` for your machine locally once. You can refer to [this](https://support.magplus.com/hc/en-us/articles/203808748-iOS-Creating-a-Distribution-Certificate-and-p12-File) guide. Download the `.p12` file for use later. Remember the password used to create this certificate as we will need this later
- Create a `Provisioning Profile` for your `Bundle ID` you registered above. You can refer to [this](https://support.staffbase.com/hc/en-us/articles/115003598691-Creating-the-iOS-Provisioning-Profiles) guide. Download the profile for use later.

#### Step 3: Getting the options.plist
- In the following app
   - Replace `BUNDLE ID` with your `Bundle Identifier` (You got that already from Step 1)
   - Replace `PROVISIONING PROFILE NAME` with your Provisioning Profile Name (You already created one in Step 2, use that)
   - Replace `TEAM_ID` with your team id. Look at [this](https://stackoverflow.com/a/18727947) answer on "How to find your Team ID"
<details>
<summary><i>Click to View app</i></summary>

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>generateAppStoreInformation</key>
	<false/>
	<key>manageAppVersionAndBuildNumber</key>
	<true/>
	<key>method</key>
	<string>app-store</string>
	<key>provisioningProfiles</key>
	<dict>
		<key>BUNDLE-ID</key>
		<string>PROVISION PROFILE NAME</string>
	</dict>
	<key>signingCertificate</key>
	<string>Apple Distribution</string>
	<key>signingStyle</key>
	<string>manual</string>
	<key>stripSwiftSymbols</key>
	<true/>
	<key>teamID</key>
	<string>TEAM_ID</string>
	<key>uploadBitcode</key>
	<false/>
	<key>uploadSymbols</key>
	<true/>
</dict>
</plist>
```
</details>

- Create a new file called `options.plist` and save the above contents in that file

#### Step 4: Making an app specific password
- Read the [official guide](https://support.apple.com/en-us/HT204397) to create an app specific password and remember it(;P)
- The pipeline uses this password to upload an ipa to testflight

#### Step 5: Bringing it all together
- Add the following keys to [Github Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
  - `BUILD_CERTIFICATE_BASE64` : The base64 of the p12 file we generated(Step 2)
  - `P12_PASSWORD`: The password of the p12 certificate generated above in Step 2
  - `BUILD_PROVISION_PROFILE_BASE64`: The provisioning profile in base64(Step 2)
  - `KEYCHAIN_PASSWORD` : The password used to store the keychain in the local keystore of the Github Runner(Any random value)
  - `IOS_PLIST`: The options.plist file needed to make an ipa out of the xcarchive generated by flutter(Step 3)
  - `APPSTORE_PASSWORD`: The password passed to altool to upload the ipa to the store(Step 4)
- To generate a base64 string, use the following command, replacing `FILENAME` with your filename

```shell
openssl base64 < FILENAME | tr -d '\n' | tee ENCODED_FILENAME.txt
```

### Pushing to protected branches
- If the branches that you will be running CD on are protected, you will need to use a [`Personal Access Token (PAT)`](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) to commit the version changes.
- After creating the `PAT`, exclude the account that the token belongs to from the [`branch protection rules`](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/managing-a-branch-protection-rule#creating-a-branch-protection-rule).
- Save the token in github secrets and update the key name in the `cd.yml` file under each `checkout` action.
- Since our `CD` workflow is triggered on a push, and we create a new commit in the workflow itself, the commit message created by the `CD` workflow includes `[skip ci]` tag so that the workflow does not end up in an infinite loop. Read more about this [here](https://docs.github.com/en/actions/managing-workflow-runs/skipping-workflow-runs)

**If you do not plan to use the CD workflow on protected branches, you can remove the token part from the checkout actions.**
