import { renderToString } from "react-dom/server"

function Page() {
  return <html lang="en"><body>hello</body></html>
}

Bun.serve({
  port: 3000,
  routes: {
    "/": () => {
      const html = renderToString(<Page />)
      return new Response(`<!doctype html>${html}`, {
        headers: {"content-type": "text/html;charset=utf-8"},
      })
    },
  },
})
