
# easySlack

<!-- badges: start -->
<!-- badges: end -->

The goal of easySlack is to send message to a specific channel of slack.

## Installation

You can install the developed version of easySlack from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("ykunisato/easySlack")
```

## Example

You can add the information of Slack to environment variables with set_slack(). Please change the arguments to suite your settings.

``` r
library(easySlack)
set_slack("GitHub access token", "#r", "Mr.R")
```

You can send the message to Slack with send_slack(). 

``` r
send_slack("R has finished my too long simulation!")
```
