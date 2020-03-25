# Neuro Data Science (Summer 2020)

[![Netlify Status](https://api.netlify.com/api/v1/badges/63957833-e9c9-4218-b69a-0ef4d73de6ac/deploy-status)](https://app.netlify.com/sites/neurodatasci-course-2020/deploys)

This is the website of QLSC 612: Fundamentals in Neuro Data Science (Summer 2020) built with [hugo](https://gohugo.io/), and deployed with [netlify](https://www.netlify.com/).

To develop this locally, you will need to:

1. Clone/fork this GitHub repo: `git clone https://github.com/neurodatascience/course-2020.git`
2. Make sure you're inside the **course-2020** directory (i.e., `cd course-2020`) then clone the submodule for themes: `git submodule update --init --recursive --remote`
3. If [Hugo](https://gohugo.io/) is not installed, follow the steps in [their documentation](https://gohugo.io/getting-started/installing/) to install it on your machine.
4. To run the website locally, make sure you are still in `course-2020` directory and type `hugo serve -D`.
   - The -D option is to serve the website including the draft .md files.
5. Open a web browser and navigate to the URL printed in the terminal.
