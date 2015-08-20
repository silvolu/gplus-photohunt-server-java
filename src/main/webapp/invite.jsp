<!--
/*
 * Copyright (c) 2013 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */
-->
<%-- Generates schema.org microdata that can be parsed to populate snippet 
for invite interactive post--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.plus.samples.photohunt.model.Theme"%>
<%@ page import="com.google.plus.samples.photohunt.model.Photo"%>
<%@ page import="static com.google.plus.samples.photohunt.model.OfyService.ofy"%>
<%@ page import="java.util.List"%>
<%

String imageUrl = "";
String name = "";

Theme currentTheme = Theme.getCurrentTheme();
Photo featPhoto = ofy().load().type(Photo.class)
    .filter("themeId", currentTheme.getId()).first().get();

if (featPhoto != null) {
  imageUrl = featPhoto.getThumbnailUrl();
  name = "Photo by " + featPhoto.getOwnerDisplayName() + " for #" +
  currentTheme.getDisplayName().toLowerCase().replaceAll("[\\s,]", "") +
      " | #photohunt";
} else {
  imageUrl = "/images/interactivepost-icon.png";
  name = "";
}
%>
<!DOCTYPE html>
<html>
<head>
  <script type="text/javascript">
    window.location.href = 'index.html';
  </script>
  <title><%= name %></title>
</head>
<body itemscope itemtype="http://schema.org/Thing">
  <h1 itemprop="name"><%= name %></h1>
  <img itemprop="image" src="<%= imageUrl %>" />
</body>
</html>