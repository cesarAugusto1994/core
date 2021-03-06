@api
Feature: recreate-master-key

	@masterkey_encryption
	Scenario: recreate masterkey
		Given user "admin" has been created
		And user "admin" has uploaded file "data/textfile.txt" to "/somefile.txt"
		When the administrator successfully recreates the encryption masterkey using the occ command
		And user "admin" logs in to a web-style session
		And user "admin" logs in to a web-style session
		Then the downloaded content when downloading file "/somefile.txt" for user "admin" with range "bytes=0-6" should be "This is"

	@masterkey_encryption
	Scenario: recreate masterkey and upload data
		Given user "user0" has been created
		And user "user0" has uploaded file "data/textfile.txt" to "/somefile.txt"
		When the administrator successfully recreates the encryption masterkey using the occ command
		And user "admin" logs in to a web-style session
		And user "user0" logs in to a web-style session
		And user "user0" uploads chunk file "1" of "1" with "AA" to "/somefile.txt" using the WebDAV API
		Then the downloaded content when downloading file "/somefile.txt" for user "user0" with range "bytes=0-3" should be "AA"

