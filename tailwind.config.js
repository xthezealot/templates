// v3
module.exports = {
	content: ["./components/**/*.templ"],
	plugins: [
		require("@tailwindcss/typography"),
		require("@tailwindcss/forms"),
		require("@tailwindcss/aspect-ratio"),
		require("@tailwindcss/container-queries"),
	],
};
