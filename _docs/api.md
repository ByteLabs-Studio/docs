---
layout: default
title: API Reference
---

# API Reference

This section contains the API documentation for ByteLab Studio projects.

## ByteLab Desktop API

### Tauri Commands

The ByteLab desktop application exposes Tauri commands for system integration.

#### System Information

```rust
#[tauri::command]
async fn get_system_info() -> Result<SystemInfo, String> {
    // Implementation
}
```

**JavaScript Usage:**
```typescript
import { invoke } from '@tauri-apps/api/tauri';

const systemInfo = await invoke<SystemInfo>('get_system_info');
console.log(systemInfo);
```

#### File Operations

```rust
#[tauri::command]
async fn read_file(path: String) -> Result<String, String> {
    // Implementation
}
```

**JavaScript Usage:**
```typescript
const content = await invoke<string>('read_file', { 
    path: '/path/to/file' 
});
```

### Event System

#### Listening to Events

```typescript
import { listen } from '@tauri-apps/api/event';

const unlisten = listen('update-available', (event) => {
    console.log('Update available:', event.payload);
});

// Cleanup
unlisten.then(fn => fn());
```

#### Emitting Events

```typescript
import { emit } from '@tauri-apps/api/event';

await emit('user-action', { 
    action: 'save', 
    data: 'example' 
});
```

## Dashboard API

### REST Endpoints

The dashboard provides RESTful API endpoints for data management.

#### Authentication

Most endpoints require authentication. Include your API key in the request headers:

```http
Authorization: Bearer YOUR_API_KEY
```

#### Projects API

##### Get All Projects

```http
GET /api/projects
```

**Response:**
```json
{
  "projects": [
    {
      "id": "proj_123",
      "name": "My Project",
      "description": "Project description",
      "created_at": "2024-01-01T00:00:00Z",
      "updated_at": "2024-01-01T00:00:00Z"
    }
  ]
}
```

##### Create Project

```http
POST /api/projects
```

**Request Body:**
```json
{
  "name": "New Project",
  "description": "Project description",
  "settings": {
    "theme": "dark",
    "language": "typescript"
  }
}
```

**Response:**
```json
{
  "id": "proj_456",
  "name": "New Project",
  "description": "Project description",
  "created_at": "2024-01-01T00:00:00Z"
}
```

##### Update Project

```http
PUT /api/projects/:id
```

**Request Body:**
```json
{
  "name": "Updated Project",
  "description": "Updated description"
}
```

##### Delete Project

```http
DELETE /api/projects/:id
```

#### Users API

##### Get Current User

```http
GET /api/users/me
```

**Response:**
```json
{
  "id": "user_123",
  "username": "johndoe",
  "email": "john@example.com",
  "avatar_url": "https://example.com/avatar.jpg",
  "created_at": "2024-01-01T00:00:00Z"
}
```

##### Update User Profile

```http
PUT /api/users/me
```

**Request Body:**
```json
{
  "username": "newusername",
  "email": "newemail@example.com"
}
```

### WebSocket API

#### Real-time Updates

Connect to the WebSocket endpoint for real-time updates:

```javascript
const ws = new WebSocket('wss://api.bytelab.studio/ws');

ws.onmessage = (event) => {
    const data = JSON.parse(event.data);
    console.log('Received:', data);
};
```

#### Message Types

##### Project Update

```json
{
  "type": "project_update",
  "data": {
    "project_id": "proj_123",
    "changes": {
      "name": "Updated Name"
    }
  }
}
```

##### System Notification

```json
{
  "type": "notification",
  "data": {
    "title": "Build Complete",
    "message": "Your project has been built successfully",
    "level": "success"
  }
}
```

## Error Handling

### HTTP Status Codes

- `200` - Success
- `201` - Created
- `400` - Bad Request
- `401` - Unauthorized
- `403` - Forbidden
- `404` - Not Found
- `422` - Validation Error
- `500` - Internal Server Error

### Error Response Format

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": {
      "field": "name",
      "reason": "Required field missing"
    }
  }
}
```

## Rate Limiting

API endpoints are rate limited to prevent abuse:

- **Dashboard API**: 100 requests per minute
- **WebSocket**: 10 messages per second

Rate limit headers are included in responses:

```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1640995200
```

## SDK Examples

### JavaScript/TypeScript

```typescript
import { ByteLabAPI } from '@bytelab/sdk';

const api = new ByteLabAPI({
    apiKey: 'your-api-key',
    baseURL: 'https://api.bytelab.studio'
});

// Get projects
const projects = await api.projects.list();
console.log(projects);

// Create project
const project = await api.projects.create({
    name: 'My Project',
    description: 'Description'
});
```

### Python

```python
from bytelab_sdk import ByteLabAPI

api = ByteLabAPI(api_key='your-api-key')

# Get projects
projects = api.projects.list()
print(projects)

# Create project
project = api.projects.create(
    name='My Project',
    description='Description'
)
```

### Rust

```rust
use bytelab_sdk::{ByteLabAPI, Config};

let config = Config::new()
    .api_key("your-api-key")
    .base_url("https://api.bytelab.studio");

let api = ByteLabAPI::new(config);

// Get projects
let projects = api.projects.list().await?;
println!("{:?}", projects);
```

## Authentication

### API Key Authentication

Generate API keys from the dashboard settings:

1. Go to Settings → API Keys
2. Click "Generate New Key"
3. Copy the key and store it securely

### OAuth2

For third-party integrations:

```http
POST /oauth/token
```

**Request Body:**
```json
{
  "grant_type": "client_credentials",
  "client_id": "your_client_id",
  "client_secret": "your_client_secret"
}
```

**Response:**
```json
{
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
  "token_type": "Bearer",
  "expires_in": 3600
}
```

## Testing

### API Testing Tools

- **Postman**: Import API collection
- **Insomnia**: REST client
- **curl**: Command line testing

### Example curl Commands

```bash
# Get projects
curl -H "Authorization: Bearer YOUR_API_KEY" \
     https://api.bytelab.studio/api/projects

# Create project
curl -X POST \
     -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"name":"Test Project"}' \
     https://api.bytelab.studio/api/projects
```
