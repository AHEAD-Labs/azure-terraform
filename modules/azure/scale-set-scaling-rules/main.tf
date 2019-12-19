resource "azurerm_monitor_autoscale_setting" "autoscale" {
  name                = "autoscale-cpu"
  target_resource_id  = var.target_resource_id
  location            = var.location
  resource_group_name = var.resource_group_name
  enabled = var.enabled

  notification {
    email {
      send_to_subscription_administrator    = true
      send_to_subscription_co_administrator = true
      custom_emails                         = [var.managed_by]
    }
  }

  profile {
    name = "autoscale-cpu"

    capacity {
      default = var.capacity
      minimum = 2
      # cannot go over 100
      maximum = 100
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = var.metric_resource_id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
      }


      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = var.metric_resource_id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 15
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }

    }


  }
}