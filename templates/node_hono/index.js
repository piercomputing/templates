import { Hono } from 'hono'
import { serve } from '@hono/node-server'

const app = new Hono()

app.get('/', (c) => c.json({ status: 'ok' }))

app.get('/health', (c) => c.json({ status: 'healthy' }))

const port = parseInt(process.env.PORT || '8080', 10)
serve({ fetch: app.fetch, port }, (info) => {
  console.log(`Listening on http://0.0.0.0:${info.port}`)
})
