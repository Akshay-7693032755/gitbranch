resource "aws_sns_topic" "snstopic" {
    name = "sns-topic-name"
    display_name = "sns-demo-topic"
    tags = {
        Name = "sns-demo-topic-aleart"
    }
  
}

resource "aws_sns_topic_subscription" "thisawssnstopicsubscription" {
    topic_arn = aws_sns_topic.snstopic.arn
    protocol = "email"
    endpoint = "choudhary50064@gmail.com"

}