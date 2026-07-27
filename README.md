# Pier starter templates

Source of truth for [Pier](https://pier.run)'s starter templates — the code
behind **Deploy → From a template** in the console, `pier add app --template`,
and the public `piercomputing/pier-template-<id>` repositories.

## Layout

```
templates/<id>/     one template per directory; files ending in .tmpl are
                    rendered by Pier's scaffolder ({{.AppName}}, {{.AppSlug}},
                    {{.SiteName}}, {{.SiteSlug}})
scripts/            render-neutral.sh — renders .tmpl with neutral values
                    (what CI builds and what the per-template repos contain)
```

## How changes ship

1. PR against this repo; CI builds every changed template.
2. On merge to `main`, the sync workflow renders each template with neutral
   values and pushes it to its `piercomputing/pier-template-<id>` repository
   (marked as a GitHub template repository). Those repos are what the Pier
   platform builds for instant template deploys, and what "Use this
   template" / `git clone` hand to users.
3. Pier vendors this repo back into its monorepo (`make templates-vendor`)
   so the CLI's embedded scaffolds stay in step.

Dependency updates are automated via Renovate; every bump runs the full
template CI before merge.

## License

MIT — see [LICENSE](LICENSE).
