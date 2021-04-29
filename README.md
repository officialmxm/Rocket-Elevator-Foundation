# Rocket Elevators Information System <img src="app/assets/images/favicon.png" align="right" alt="Rocket Elevators logo by Maxime Auger" width="100" height="">

URL for our site http://rocketmax.xyz/


📚 Instructions to acces to the admin panel:

To log as Admin:
```
1. click the log in the nav bar
2. Username:admin@rocketmax.xyz
3. password: 123456
4. click on the admin button in nav bar
```


-----------------------------------------------------------------------------------------------
# Rocket Elevators Consolidation <img src="app/assets/images/favicon.png" align="right" alt="Rocket Elevators logo" width="" height="100">


## CodeBoxx Odyssey - Week 9

-----------------------------------------------------------------------------------------------



To improve Rocket Elevators service and products offering, we implemented seven APIs, which will are some of the most used products on the market:
* Google Maps
* IBM Watson + (Star Wars features)
* ZenDesk
* Spotfy
* ReCaptcha

-----------------------------------------------------------------------------------------------

Gems used <img src="https://w7.pngwing.com/pngs/96/713/png-transparent-ruby-on-rails-programming-language-rubygems-php-ruby-gem-angle-heart-logo.png" align="right" alt="gem image, from Ruby on Rails logo" width="70" height="">

* gem 'figaro'
      https://rubygems.org/gems/figaro/versions/1.1.1

* gem 'ibm_watson'
      https://rubygems.org/gems/ibm_watson

* gem "zendesk_api"
      https://rubygems.org/gems/zendesk_api

* gem 'rspotify'
      https://rubygems.org/gems/rspotify

* gem 'rack-cors'
      https://rubygems.org/gems/rack-cors

* gem 'active_model_serializers'
      https://rubygems.org/gems/active_model_serializers


* gem "recaptcha", '~> 5.7'
      https://rubygems.org/gems/recaptcha


-----------------------------------------------------------------------------------------------

># [Google Maps](https://www.google.com/maps) <img src="app/assets/images/googleMapsLogo.png" align="right" alt="Google Maps logo" width="" height="100">

Google Maps from now on is used as an extension within our secure back office (reserved for Rocket Elevators employees) in order to geolocate our customers buildings on a map and display statistics on a location:
* Location of the Buildings
* Number of floors in the building (If the information is available)
* Client name
* Number of Batteries
* Number of Columns
* Number of Elevators
* Full name of technical contact

The geolocation page is in the Admin section of the website, available only to authenticated members.

![](app/assets/images/googleMapsBackoffice.jpg)


-----------------------------------------------------------------------------------------------
># [IBM Watson](https://www.ibm.com/watson) <img src="app/assets/images/watsonLogo.png" align="right" alt="IBM Watson logo" width="200" height=""> 

IBM through its Artificial Intelligence Watson provides application developers with many services. Among the most used, there is a Text-to-Speech functionality which can be used on a multitude of platforms.

With IBM Watson, Rocket Elevators adds text-to-speech functionality to their Home Dashboard (/ admin). Everytime the Admin Dashboard page appears, there is the option to start the briefing.

The type of information that speech synthesis allows are the following:

1. Greetings to the logged users
2. There are currently XXX elevators deployed in the XXX buildings of your XXX customers
3. Currently, XXX elevators are not in Running Status and are being serviced
4. You currently have XXX quotes awaiting processing
5. You currently have XXX leads in your contact requests
6. Batteries are deployed across XXX cities

To provide the type of voice summary described, it is necessary to execute the appropriate queries in the database to collect the relevant data. Then it forms sentences in English and combine them with the data collected.


![](app/assets/images/watsonBackoffice.jpg)



># [Star Wars](https://www.starwars.com/) <img src="app/assets/images/starwarsLogo.png" align="right" alt="Star Wars logo" width="" height="80"> 

Use of IBM Watson to say messages from the film Star Wars, automatically and randomly generated using the gem Faker.


![](app/assets/images/starwarsbackoffice.jpg)


-----------------------------------------------------------------------------------------------
># [ZenDesk](https://www.zendesk.com/) <img src="app/assets/images/zendeskLogo.png" align="right" alt="ZenDesk logo" width="" height="80"> 

  ZenDesk website and account informations: 
  - Webpage: https://www.zendesk.com/
  - Account name:  Rocketmax
  - Organization: Rocket Elevators
  - Rocket Elevators ZenDesk page: https://rocketmax.zendesk.com/

The ZenDesk platform can be powered by a call to the API and the software can then process requests depending on the type.

* The website's “Contact Us” form creates a new “Question” type ticket in ZenDesk
![](app/assets/images/ZenDeskContactUs1.jpg)

* The website's “Get a Quote” form creates a new “Task” type ticket in ZenDesk
![](app/assets/images/ZenDeskQuotes1.jpg)

* The tickets created are visible in the ZenDesk Console and it is possible to respond to them or even manage a workflow for these contacts.
![](app/assets/images/ZenDesk1.jpg)

The content of each ticket created must include the contact information which has been stored in the database:

Subject: **[Full Name]** from **[Company Name]**

Comment: The contact **[Full Name]** from company **[Company Name]** can be reached at email  **[E-Mail Address]** and at phone number **[Phone]**. **[Department]** has a project named **[Project Name]** which would require contribution from Rocket Elevators. 

**[Project Description]**

Attached Message: **[Message]**

The Contact uploaded an attachment


-----------------------------------------------------------------------------------------------

# Spotify
------

># [Spotify](https://www.spotify.com/us/) <img src="app/assets/images/spotifyLogo.png" align="right" alt="Spotify logo" width="" height="80"> 

Spotify API allows to listen to music when logged in on the backoffice.


![](app/assets/images/spotfybackoffice.jpg)

-----------------------------------------------------------------------------------------------



># [reCAPTCHA](https://www.google.com/recaptcha/about/) <img src="app/assets/images/recaptchaLogo.png" align="right" alt="Recaptcha logo" width="" height="80"> 

ReCAPTCHA is a service that helps protect Rocket Elevators website from spam and abuse, is a test to tell human and robots apart.

It is implemented in the Contact Us and Quote forms.

ReCAPTCHA on Contact Us form:
![](app/assets/images/recaptchaIndexPage.jpg)

ReCAPTCHA on Quote form:
![](app/assets/images/recaptchaQuoteForm.jpg)


-----------------------------------------------------------------------------------------------
# ntervention


-----------------------------------------------------------------------------------------------
# Rest-API ASP.NET

**Postman collection link:**  https://www.getpostman.com/collections/968f9e060e66ec75c489
* GET: Returns all fields of all intervention Request records that do not have a start date and are in "Pending" status.

https://restapi-max.azurewebsites.net/api/intervention


* PUT: Change the status of the intervention request to "InProgress" and add a start date and time (Timestamp).

https://restapi-max.azurewebsites.net/api/intervention/{id}/inprogress

PUT: Change the status of the request for action to "Completed" and add an end date and time (Timestamp).

https://restapi-max.azurewebsites.net/api/intervention/{id}/completed


-- Maxime Auger






















