# Service Catalogue
## Registration Service
Consumer    
* Customer Mobile App
* Admin Mobile App

Request
  * Mobile Number
            ..* Name
            - Post Code
            - Mobile Metadata (platform, version)
            - App Metadata (version,id)
Response 
            - Status
            - CDN url of QR
            - User Id
            - User Role
Highlevel Steps
            - Encrypt customer data
            - Make DB entry
            - Create an QR Code
            - Upload to S3
            - Send execution status with CDN URL
## Add Reward Service
Consumer    - Admin Mobile App (via scaning QR)
Request
            - Encrypted QR scaned data
            - Sell value
            - User Id
            - User Role
            - Mobile Metadata (platform, version)
            - App Metadata (version,id)
Response 
            - Status
            - Rewrads point balance
Highlevel Steps
            - Decrypt scaned data to get UserId
            - Caculate reward point
            - Update reward balance based on UserId
            - Send execution status with reward balance
## Retrieve Reward Service
Consumer    - Customer Mobile App (via MyAccount UserId)
            - Admin Mobile App (via scaning QR)
Request
            - Encrypted QR scaned data/UserId
            - UserRole
            - Mobile Metadata (platform, version)
            - App Metadata (version,id)
Response 
            - Status
            - Rewrad point balance
            - Mobile Number
            - Name
            - Post Code
Highlevel Steps
            - Decrypt scaned data to get UserId
            - Get reward balance & customer data
            - Send execution status with reward balance, customer data

