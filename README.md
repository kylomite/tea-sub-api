<a id="readme-top"></a>
<h1 align='center'> T-Trade Back End API</h1>
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-this-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#set-up">Set Up</a></li>
        <li><a href="#accessing-endpoints">Accessing Endpoints</a></li>
      </ul>
    </li>
    <li><a href="#contributors">Contributors</a></li>
  </ol>
</details>

## About this project
* The T-Trade back end API is designed to produce instances of tea subscriptions. Each subscription contains data about the subscription such as its active status, and the frequency of delivery. Each subscription also returns data about the tea being ordered and the customer who orders it. All Routing is passed through subscription, there are no currently endpoints implemented to access teas, or customers directly.
* This application is design to be run locally in conjunction with the corresponding front end repo [Link to Front end repo](https://github.com/kylomite/tea-sub-front-end).

### Built With:
 ![Ruby][Ruby]<br/> 
#### Frameworks
 ![Ruby_on_rails][Ruby_on_rails]<br/>
#### Dependencies
 ![Simple Cov][Simple_cov]<br/>
 ![JSON_API][JSON_api]<br/>
 ![Rspec_rails][Rspec_rails]<br/>
 ![Pry][Pry]<br/>
 ![Rack_CORS][Rack_CORS]


## Getting Started
### Installation

1. Clone this repo
  ```
  git clone git@github.com:kylomite/tea-sub-api.git
  ```
2.  Move into project directory and install necessary dependencies and run
  ```
  cd tea-sub-api
  bundle install
  ```
3. Change git remote url to avoid accidental pushes to base project
  ```
  git remote set-url origin github_username/repo_name
  git remote -v # confirm the changes
  ```

### Set Up
1. In the project directory create, migrate and seed local database
 ```
  rails db:create 
  rails db:migrate
  rails db:seed
 ```
2. Start the local server 
```
  rails s
```
- *NOTE*: Server should be running on `localhost:3000`
 - The back end API should now be live

### Accessing Endpoints
- GET: All subscriptions
```
http://127.0.0.1:3000/api/v1/subscriptions
```
- GET: Single subscriptions
```
http://127.0.0.1:3000/api/v1/subscriptions/<subscription_ID>
```
- Patch: Toggle single subscription's active status
```
http://127.0.0.1:3000/api/v1/subscriptions/<subscription_ID>, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
    },
    body: {
      toggle_active: true,
    },
  }
```

## Contributors
<section style="display: flex; gap: 10px;">
  <div style="text-align: center;">
    <h4>Kyle Delaney</h4>
    <img style="width: 50px; border-radius: 25px;" src="https://media.licdn.com/dms/image/v2/D4E03AQGp6EiUDBP-0Q/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724335224935?e=1735171200&v=beta&t=UodzNOsspYW_O9ZdmoqgkwnGf0UEvIlrBUnjMVHSM0A" alt="Profile 1" />
    <br/>
    <a href="https://www.linkedin.com/in/kylehamptondelaney/" target="_blank">LinkedIn<a> 
    <br/> 
    <a href="https://github.com/kylomite" target="_blank">Github</a>
  </div>


<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[Ruby_on_rails]: https://img.shields.io/badge/ruby_on_rails--7.1.4-CC0000?style=for-the-badge&logo=ruby&logoColor=white
[Simple_cov]: https://img.shields.io/badge/simplecov-FFC107?style=for-the-badge&logo=ruby&logoColor=white
[JSON_api]: https://img.shields.io/badge/JSON--API-3E4C59?style=for-the-badge&logo=json&logo
[Rspec_rails]: https://img.shields.io/badge/rspec--rails-FF0000?style=for-the-badge
[Pry]: https://img.shields.io/badge/pry-9932CC?style=for-the-badge&logo=ruby&logoColor=white
[Rack_CORS]: https://img.shields.io/badge/rack--cors-4CAF50?style=for-the-badge&logo=ruby&logoColor=white
[Ruby]: https://img.shields.io/badge/ruby--3.2.2-CC342D?style=for-the-badge&logo=ruby&logoColor=white
