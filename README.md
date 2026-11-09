# worldProj

A Quarto dashboard (Shiny server) for drawing world maps: crop to a
longitude/latitude box, simplify boundaries (Visvalingam or Douglas-Peucker),
drop small islands, and re-project using a suggested CRS.

Live at <https://apps.robwiederstein.org/worldProj/>.

Self-hosted in Docker (`docker-compose.yml`); pushes to `main` on Gitea are
deployed by `.gitea/workflows/deploy.yaml` and mirrored to GitHub.
