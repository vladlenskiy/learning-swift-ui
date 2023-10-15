// AppRouterGroup.swift
// A type that manages the pages you want to go with LinkNavigator.

import LinkNavigator

struct AppRouterGroup {
  var routers: [RouteBuilder] {
    [
      AuthRouteBuilder(),
      HomeRouteBuilder()
    ]
  }
}
