# USING EASYPOST API TO CREATE SHIPPING LABEL

In this project, I created a simple form using Rails that makes a call to the Easy Post API that then creates the label and redirects the user to the created label. I chose to think that this would be used for domestic shipping even though the API can do international shipping. I added error handling to any fields that are required to create the shipment label.

To get it running:
* clone
* run `bundle install`
* run `rails s` to start rails server

Once the program is running go to **/shipment_printers** for a quick welcome or **/shipment_printers/new** to see the form and create a label
