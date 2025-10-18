import { renderToString } from "react-dom/server"

function Page() {
  return (
    <html lang="en">
      <body>hello</body>
    </html>
  )
}

Bun.serve({
  port: 3000,
  routes: {
    "/": () =>
      new Response(`<!doctype html>${renderToString(<Page />)}`, {
        headers: { "content-type": "text/html;charset=utf-8" },
      }),
  },
})
