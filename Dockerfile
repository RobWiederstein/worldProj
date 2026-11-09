# R 4.4.0 matches renv.lock; geospatial includes GDAL/PROJ/GEOS/udunits for sf
FROM rocker/geospatial:4.4.0

# Same Quarto version as lifeExpectancy (Quarto dashboard + Shiny server)
RUN QUARTO_VERSION=1.5.57 /rocker_scripts/install_quarto.sh

WORKDIR /app

# Restore packages first so this layer is cached between code changes.
# Binary packages from Posit Package Manager keep the build fast.
ENV RENV_CONFIG_REPOS_OVERRIDE=https://p3m.dev/cran/__linux__/jammy/latest
COPY renv.lock .Rprofile ./
COPY renv/activate.R renv/settings.json renv/
COPY R/ R/
RUN R -e "renv::restore(prompt = FALSE)"

COPY data/ data/
COPY dash.qmd ./

# Pre-render at build time so the container starts quickly
RUN quarto render dash.qmd

EXPOSE 3838

CMD ["quarto", "serve", "dash.qmd", "--host", "0.0.0.0", "--port", "3838", "--no-render"]
