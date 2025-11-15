---
layout: default
title: API Reference
---

# API Reference

This section contains the API documentation for your project.

## Authentication

Most API endpoints require authentication. Include your API key in the request headers:

```http
Authorization: Bearer YOUR_API_KEY
```

## Endpoints

### Get Users

Retrieve a list of all users.

```http
GET /api/users
```

**Response:**
```json
{
  "users": [
    {
      "id": 1,
      "name": "John Doe",
      "email": "john@example.com"
    }
  ]
}
```

### Create User

Create a new user.

```http
POST /api/users
```

**Request Body:**
```json
{
  "name": "Jane Doe",
  "email": "jane@example.com"
}
```

## Error Handling

The API returns standard HTTP status codes:

- `200` - Success
- `400` - Bad Request
- `401` - Unauthorized
- `404` - Not Found
- `500` - Internal Server Error
