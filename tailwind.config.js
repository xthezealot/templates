module.exports = {
	content: ["./components/**/*.templ"],
	theme: {
		extend: {
			colors: {
				primary: "#1d4ed8",
			},
		},
	},
	plugins: [
		require("@tailwindcss/typography"),
		require("@tailwindcss/forms"),
		require("@tailwindcss/aspect-ratio"),
		require("@tailwindcss/container-queries"),
	],
}
