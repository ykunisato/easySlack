#' @title Setting the slack information to system
#' @description \code{set_slack} set the slack information to system
#'
#' @param slack_token slack acess token
#' @param slack_channel slack channel
#' @param slack_username slack username
#' @export
#' @examples
#' # set_slack("GitHub access token", "#r", "Mr.R")

set_slack <- function(slack_token,
                      slack_channel = "#general",
                      slack_username = "R"){
  if(missing(slack_token)){
    stop("Please set slack_token")
  }
  Sys.setenv(SLACK_TOKEN=slack_token)
  Sys.setenv(SLACK_CHANNEL=slack_channel)
  Sys.setenv(SLACK_USERNAME=slack_username)
}


#' @title Sending the message to slack channel
#' @description \code{send_slack} send the message to slack channel
#'
#' @importFrom httr POST
#' @param message message send to slack
#' @export
#' @examples
#' # send_slack("Hello!")

send_slack <- function(message = "Analysis has been completed"){
  # check argument
  if (Sys.getenv("SLACK_TOKEN") == "") {
    stop("Please set slack_token with set_slack")
  }
  if (Sys.getenv("SLACK_CHANNEL") == "") {
    stop("Please set slack_channel with set_slack")
  }
  if (Sys.getenv("SLACK_USERNAME") == "") {
    stop("Please set slack_username with set_slack")
  }

  # send message to slack
  httr::POST(url="https://slack.com/api/chat.postMessage",
             body = list(token = Sys.getenv("SLACK_TOKEN"),
                         channel = Sys.getenv("SLACK_CHANNEL"),
                         username = Sys.getenv("SLACK_USERNAME"),
                         text = paste(format(as.POSIXlt(Sys.time(), tz = "Asia/Tokyo"),"%Y/%m/%d %H:%M"),message)))
}
