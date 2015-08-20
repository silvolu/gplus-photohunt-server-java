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
 for photos interactive posts--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="com.google.plus.samples.photohunt.model.Photo"%>
<%@ page import="static com.google.plus.samples.photohunt.model.OfyService.ofy"%>
<%@ page import="java.util.List"%>
<%

String imageUrl = "";
String name = "";
String description = "";

String photoId = request.getParameter("photoId");
String redirectUrl = "/index.html?photoId=" + photoId;

Photo photo = ofy().load().type(Photo.class).id(Long.parseLong(photoId)).get();
if (photo != null) {
  name = "Photo by " + photo.getOwnerDisplayName() + " for " +
      photo.getThemeDisplayName() + " | Photo Hunt";
  description = photo.getOwnerDisplayName() +
      " needs your vote to win this hunt.";
  imageUrl = photo.getThumbnailUrl();
}
%>
<!DOCTYPE html>
<html>
<head>
  <% if (redirectUrl != null) { %>
  <script type="text/javascript">
    window.location.href = '<%= redirectUrl %>';
  </script>
  <% } %>
  <title><%= name %></title>
</head>
<body itemscope itemtype="http://schema.org/Thing">
  <h1 itemprop="name"><%= name %></h1>
  <img itemprop="image" src="<%= imageUrl %>" />
  <p itemprop="description"><%= description %></p>
</body>
</html>