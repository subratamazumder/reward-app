# Service Catalog
[Registration Service](#Registration-Service)

[Add Reward Service](#Add-Reward-Service)

[Retrieve Reward Service](#Retrieve-Reward-Service)
## Registration Service
Consumer    
* Customer Mobile App
* Admin Mobile App

Request
* Mobile Number
* Name
* Post Code
* Mobile Meta data (platform, version)
* App Meta data (version,id)
  
Response 
* Status
* CDN url of QR
* User Id
* User Role

High Level Steps
* Encrypt customer data
* Make DB entry
* Create an QR Code
* Upload to S3
* Send execution status with CDN URL

## Add Reward Service
Consumer
* Admin Mobile App (via scaning QR)
Request
* Encrypted QR scanned data
* Sell value
* User Id
* User Role
* Mobile Meta data (platform, version)
* App Meta Data (version,id)

Response 
* Status
* Rewards point balance

High Level Steps
* Decrypt scanned data to get UserId
* Calculate reward point
* Update reward balance based on UserId
* Send execution status with reward balance
## Retrieve Reward Service
Consumer
* Customer Mobile App (via MyAccount UserId)
* Admin Mobile App (via scanning QR)

Request
* Encrypted QR scanned data/UserId
* UserRole
* Mobile Meta data (platform, version)
* App Meta data (version,id)

Response 
* Status
* Reward point balance
* Mobile Number
* Name
* Post Code

High Level Steps
* Decrypt scanned data to get UserId
* Get reward balance & customer data
* Send execution status with reward balance, customer data

