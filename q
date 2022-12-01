[1mdiff --git a/.deepsource.toml b/.deepsource.toml[m
[1mindex 67e14c2..5f78382 100644[m
[1m--- a/.deepsource.toml[m
[1m+++ b/.deepsource.toml[m
[36m@@ -1,33 +1,33 @@[m
[31m-version = 1[m
[31m-[m
[31m-exclude_patterns = ["/frontend/dist/*.min.js"][m
[31m-[m
[31m-[[analyzers]][m
[31m-name = "python"[m
[31m-enabled = true[m
[31m-[m
[31m-  [analyzers.meta][m
[31m-  runtime_version = "3.x.x"[m
[31m-[m
[31m-[[analyzers]][m
[31m-name = "terraform"[m
[31m-enabled = true[m
[31m-[m
[31m-[[analyzers]][m
[31m-name = "javascript"[m
[31m-enabled = true[m
[31m-[m
[31m-  [analyzers.meta][m
[31m-  plugins = ["react"][m
[31m-[m
[31m-[[transformers]][m
[31m-name = "black"[m
[31m-enabled = true[m
[31m-[m
[31m-[[transformers]][m
[31m-name = "isort"[m
[31m-enabled = true[m
[31m-[m
[31m-[[transformers]][m
[31m-name = "prettier"[m
[32m+[m[32mversion = 1[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexclude_patterns = ["/frontend/dist/*.min.js"][m[41m[m
[32m+[m[41m[m
[32m+[m[32m[[analyzers]][m[41m[m
[32m+[m[32mname = "python"[m[41m[m
[32m+[m[32menabled = true[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  [analyzers.meta][m[41m[m
[32m+[m[32m  runtime_version = "3.x.x"[m[41m[m
[32m+[m[41m[m
[32m+[m[32m[[analyzers]][m[41m[m
[32m+[m[32mname = "terraform"[m[41m[m
[32m+[m[32menabled = true[m[41m[m
[32m+[m[41m[m
[32m+[m[32m[[analyzers]][m[41m[m
[32m+[m[32mname = "javascript"[m[41m[m
[32m+[m[32menabled = true[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  [analyzers.meta][m[41m[m
[32m+[m[32m  plugins = ["react"][m[41m[m
[32m+[m[41m[m
[32m+[m[32m[[transformers]][m[41m[m
[32m+[m[32mname = "black"[m[41m[m
[32m+[m[32menabled = true[m[41m[m
[32m+[m[41m[m
[32m+[m[32m[[transformers]][m[41m[m
[32m+[m[32mname = "isort"[m[41m[m
[32m+[m[32menabled = true[m[41m[m
[32m+[m[41m[m
[32m+[m[32m[[transformers]][m[41m[m
[32m+[m[32mname = "prettier"[m[41m[m
 enabled = true[m
\ No newline at end of file[m
[1mdiff --git a/.github/.gitignore b/.github/.gitignore[m
[1mindex f71ab4b..a1e2f53 100644[m
[1m--- a/.github/.gitignore[m
[1m+++ b/.github/.gitignore[m
[36m@@ -1,6 +1,6 @@[m
[31m-exe.sh[m
[31m-google_deploy.yml[m
[31m-pub_key.pem[m
[31m-secret.json[m
[31m-workflow_frontend.yml[m
[32m+[m[32mexe.sh[m[41m[m
[32m+[m[32mgoogle_deploy.yml[m[41m[m
[32m+[m[32mpub_key.pem[m[41m[m
[32m+[m[32msecret.json[m[41m[m
[32m+[m[32mworkflow_frontend.yml[m[41m[m
 google_workflow.yml[m
\ No newline at end of file[m
[1mdiff --git a/.github/workflows/new_test_pipeline.yml b/.github/workflows/new_test_pipeline.yml[m
[1mindex 37c9989..cc30219 100644[m
[1m--- a/.github/workflows/new_test_pipeline.yml[m
[1m+++ b/.github/workflows/new_test_pipeline.yml[m
[36m@@ -25,4 +25,4 @@[m [mjobs:[m
         run: |[m
           gcloud auth configure-docker europe-north1-docker.pkg.dev[m
           docker tag python_backend europe-north1-docker.pkg.dev/handvask/handvask-artifacts/python_backend:latest[m
[31m-          docker push europe-north1-docker.pkg.dev/handvask/handvask-artifacts/python_backend:latest[m
\ No newline at end of file[m
[32m+[m[32m          docker push europe-north1-docker.pkg.dev/handvask/handvask-artifacts/python_backend:latest[m
[1mdiff --git a/handvask_frontend/.gitignore b/handvask_frontend/.gitignore[m
[1mindex d53d0cb..06eeeb8 100644[m
[1m--- a/handvask_frontend/.gitignore[m
[1m+++ b/handvask_frontend/.gitignore[m
[36m@@ -39,4 +39,4 @@[m [mnext-env.d.ts[m
 [m
 .env[m
 [m
[31m-package-lock.json[m
\ No newline at end of file[m
[32m+[m[32mpackage-lock.json[m
[1mdiff --git a/handvask_frontend/package-lock.json b/handvask_frontend/package-lock.json[m
[1mindex 4aef8fa..c0e9b19 100644[m
[1m--- a/handvask_frontend/package-lock.json[m
[1m+++ b/handvask_frontend/package-lock.json[m
[36m@@ -1,8 +1,3476 @@[m
 {[m
   "name": "handvask_frontend",[m
   "version": "0.1.0",[m
[31m-  "lockfileVersion": 1,[m
[32m+[m[32m  "lockfileVersion": 2,[m
   "requires": true,[m
[32m+[m[32m  "packages": {[m
[32m+[m[32m    "": {[m
[32m+[m[32m      "name": "handvask_frontend",[m
[32m+[m[32m      "version": "0.1.0",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@fortawesome/fontawesome-svg-core": "^6.2.0",[m
[32m+[m[32m        "@fortawesome/free-regular-svg-icons": "^6.2.0",[m
[32m+[m[32m        "@fortawesome/free-solid-svg-icons": "^6.2.0",[m
[32m+[m[32m        "@fortawesome/react-fontawesome": "^0.2.0",[m
[32m+[m[32m        "@popperjs/core": "^2.11.6",[m
[32m+[m[32m        "bootstrap": "^5.2.3",[m
[32m+[m[32m        "cookies-next": "^2.1.1",[m
[32m+[m[32m        "next": "13.0.0",[m
[32m+[m[32m        "react": "18.2.0",[m
[32m+[m[32m        "react-bootstrap": "^2.6.0",[m
[32m+[m[32m        "react-dom": "18.2.0",[m
[32m+[m[32m        "table": "^6.8.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "devDependencies": {[m
[32m+[m[32m        "@types/node": "18.11.7",[m
[32m+[m[32m        "@types/react": "18.0.24",[m
[32m+[m[32m        "@types/react-dom": "18.0.8",[m
[32m+[m[32m        "eslint": "8.26.0",[m
[32m+[m[32m        "eslint-config-next": "13.0.0",[m
[32m+[m[32m        "typescript": "4.8.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/runtime": {[m
[32m+[m[32m      "version": "7.20.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/runtime/-/runtime-7.20.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-NDYdls71fTXoU8TZHfbBWg7DiZfNzClcKui/+kyi6ppD2L1qnWW3VV6CjtaBXSUGGhiTWJ6ereOIkUvenif66Q==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "regenerator-runtime": "^0.13.10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/runtime-corejs3": {[m
[32m+[m[32m      "version": "7.20.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/runtime-corejs3/-/runtime-corejs3-7.20.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-v1JH7PeAAGBEyTQM9TqojVl+b20zXtesFKCJHu50xMxZKD1fX0TKaKHPsZfFkXfs7D1M9M6Eeqg1FkJ3a0x2dA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "core-js-pure": "^3.25.1",[m
[32m+[m[32m        "regenerator-runtime": "^0.13.10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@eslint/eslintrc": {[m
[32m+[m[32m      "version": "1.3.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@eslint/eslintrc/-/eslintrc-1.3.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-uj3pT6Mg+3t39fvLrj8iuCIJ38zKO9FpGtJ4BBJebJhEwjoT+KLVNCcHT5QC9NGRIEi7fZ0ZR8YRb884auB4Lg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "ajv": "^6.12.4",[m
[32m+[m[32m        "debug": "^4.3.2",[m
[32m+[m[32m        "espree": "^9.4.0",[m
[32m+[m[32m        "globals": "^13.15.0",[m
[32m+[m[32m        "ignore": "^5.2.0",[m
[32m+[m[32m        "import-fresh": "^3.2.1",[m
[32m+[m[32m        "js-yaml": "^4.1.0",[m
[32m+[m[32m        "minimatch": "^3.1.2",[m
[32m+[m[32m        "strip-json-comments": "^3.1.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.22.0 || ^14.17.0 || >=16.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://opencollective.com/eslint"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@fortawesome/fontawesome-common-types": {[m
[32m+[m[32m      "version": "6.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@fortawesome/fontawesome-common-types/-/fontawesome-common-types-6.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-rBevIsj2nclStJ7AxTdfsa3ovHb1H+qApwrxcTVo+NNdeJiB9V75hsKfrkG5AwNcRUNxrPPiScGYCNmLMoh8pg==",[m
[32m+[m[32m      "hasInstallScript": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@fortawesome/fontawesome-svg-core": {[m
[32m+[m[32m      "version": "6.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@fortawesome/fontawesome-svg-core/-/fontawesome-svg-core-6.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Cf2mAAeMWFMzpLC7Y9H1I4o3wEU+XovVJhTiNG8ZNgSQj53yl7OCJaS80K4YjrABWZzbAHVaoHE1dVJ27AAYXw==",[m
[32m+[m[32m      "hasInstallScript": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@fortawesome/fontawesome-common-types": "6.2.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@fortawesome/free-regular-svg-icons": {[m
[32m+[m[32m      "version": "6.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@fortawesome/free-regular-svg-icons/-/free-regular-svg-icons-6.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-M1dG+PAmkYMTL9BSUHFXY5oaHwBYfHCPhbJ8qj8JELsc9XCrUJ6eEHWip4q0tE+h9C0DVyFkwIM9t7QYyCpprQ==",[m
[32m+[m[32m      "hasInstallScript": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@fortawesome/fontawesome-common-types": "6.2.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@fortawesome/free-solid-svg-icons": {[m
[32m+[m[32m      "version": "6.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@fortawesome/free-solid-svg-icons/-/free-solid-svg-icons-6.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-UjCILHIQ4I8cN46EiQn0CZL/h8AwCGgR//1c4R96Q5viSRwuKVo0NdQEc4bm+69ZwC0dUvjbDqAHF1RR5FA3XA==",[m
[32m+[m[32m      "hasInstallScript": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@fortawesome/fontawesome-common-types": "6.2.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@fortawesome/react-fontawesome": {[m
[32m+[m[32m      "version": "0.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@fortawesome/react-fontawesome/-/react-fontawesome-0.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-uHg75Rb/XORTtVt7OS9WoK8uM276Ufi7gCzshVWkUJbHhh3svsUUeqXerrM96Wm7fRiDzfKRwSoahhMIkGAYHw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "prop-types": "^15.8.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@fortawesome/fontawesome-svg-core": "~1 || ~6",[m
[32m+[m[32m        "react": ">=16.3"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@humanwhocodes/config-array": {[m
[32m+[m[32m      "version": "0.11.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@humanwhocodes/config-array/-/config-array-0.11.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-jJr+hPTJYKyDILJfhNSHsjiwXYf26Flsz8DvNndOsHs5pwSnpGUEy8yzF0JYhCEvTDdV2vuOK5tt8BVhwO5/hg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@humanwhocodes/object-schema": "^1.2.1",[m
[32m+[m[32m        "debug": "^4.1.1",[m
[32m+[m[32m        "minimatch": "^3.0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@humanwhocodes/module-importer": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@humanwhocodes/module-importer/-/module-importer-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-bxveV4V8v5Yb4ncFTT3rPSgZBOpCkjfK0y4oVVVJwIuDVBRMDXrPyXRL988i5ap9m9bnyEEjWfm5WkBmtffLfA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=12.22"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/nzakas"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@humanwhocodes/object-schema": {[m
[32m+[m[32m      "version": "1.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@humanwhocodes/object-schema/-/object-schema-1.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZnQMnLV4e7hDlUvw8H+U8ASL02SS2Gn6+9Ac3wGGLIe7+je2AeAOxPY+izIPJDfFDb7eDjev0Us8MO1iFRN8hA==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/env": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/env/-/env-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-65v9BVuah2Mplohm4+efsKEnoEuhmlGm8B2w6vD1geeEP2wXtlSJCvR/cCRJ3fD8wzCQBV41VcMBQeYET6MRkg=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/eslint-plugin-next": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/eslint-plugin-next/-/eslint-plugin-next-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-z+gnX4Zizatqatc6f4CQrcC9oN8Us3Vrq/OLyc98h7K/eWctrnV91zFZodmJHUjx0cITY8uYM7LXD7IdYkg3kg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "glob": "7.1.7"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/eslint-plugin-next/node_modules/glob": {[m
[32m+[m[32m      "version": "7.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/glob/-/glob-7.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-OvD9ENzPLbegENnYP5UUfJIirTg4+XwMWGaQfQTY0JenxNvvIKP3U3/tAQSPIu/lHxXYSZmpXlUHeqAIdKzBLQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "fs.realpath": "^1.0.0",[m
[32m+[m[32m        "inflight": "^1.0.4",[m
[32m+[m[32m        "inherits": "2",[m
[32m+[m[32m        "minimatch": "^3.0.4",[m
[32m+[m[32m        "once": "^1.3.0",[m
[32m+[m[32m        "path-is-absolute": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "*"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/isaacs"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-android-arm-eabi": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-android-arm-eabi/-/swc-android-arm-eabi-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-+DUQkYF93gxFjWY+CYWE1QDX6gTgnUiWf+W4UqZjM1Jcef8U97fS6xYh+i+8rH4MM0AXHm7OSakvfOMzmjU6VA==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "android"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-android-arm64": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-android-arm64/-/swc-android-arm64-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-RW9Uy3bMSc0zVGCa11klFuwfP/jdcdkhdruqnrJ7v+7XHm6OFKkSRzX6ee7yGR1rdDZvTnP4GZSRSpzjLv/N0g==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "android"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-darwin-arm64": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-darwin-arm64/-/swc-darwin-arm64-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-APA26nps1j4qyhOIzkclW/OmgotVHj1jBxebSpMCPw2rXfiNvKNY9FA0TcuwPmUCNqaTnm703h6oW4dvp73A4Q==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "darwin"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-darwin-x64": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-darwin-x64/-/swc-darwin-x64-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-qsUhUdoFuRJiaJ7LnvTQ6GZv1QnMDcRXCIjxaN0FNVXwrjkq++U7KjBUaxXkRzLV4C7u0NHLNOp0iZwNNE7ypw==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "darwin"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-freebsd-x64": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-freebsd-x64/-/swc-freebsd-x64-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-sCdyCbboS7CwdnevKH9J6hkJI76LUw1jVWt4eV7kISuLiPba3JmehZSWm80oa4ADChRVAwzhLAo2zJaYRrInbg==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "freebsd"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-linux-arm-gnueabihf": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-linux-arm-gnueabihf/-/swc-linux-arm-gnueabihf-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-/X/VxfFA41C9jrEv+sUsPLQ5vbDPVIgG0CJrzKvrcc+b+4zIgPgtfsaWq9ockjHFQi3ycvlZK4TALOXO8ovQ6Q==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-linux-arm64-gnu": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-linux-arm64-gnu/-/swc-linux-arm64-gnu-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-x6Oxr1GIi0ZtNiT6jbw+JVcbEi3UQgF7mMmkrgfL4mfchOwXtWSHKTSSPnwoJWJfXYa0Vy1n8NElWNTGAqoWFw==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-linux-arm64-musl": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-linux-arm64-musl/-/swc-linux-arm64-musl-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-SnMH9ngI+ipGh3kqQ8+mDtWunirwmhQnQeZkEq9e/9Xsgjf04OetqrqRHKM1HmJtG2qMUJbyXFJ0F81TPuT+3g==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-linux-x64-gnu": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-linux-x64-gnu/-/swc-linux-x64-gnu-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-VSQwTX9EmdbotArtA1J67X8964oQfe0xHb32x4tu+JqTR+wOHyG6wGzPMdXH2oKAp6rdd7BzqxUXXf0J+ypHlw==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-linux-x64-musl": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-linux-x64-musl/-/swc-linux-x64-musl-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-xBCP0nnpO0q4tsytXkvIwWFINtbFRyVY5gxa1zB0vlFtqYR9lNhrOwH3CBrks3kkeaePOXd611+8sjdUtrLnXA==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-win32-arm64-msvc": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-win32-arm64-msvc/-/swc-win32-arm64-msvc-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-NutwDafqhGxqPj/eiUixJq9ImS/0sgx6gqlD7jRndCvQ2Q8AvDdu1+xKcGWGNnhcDsNM/n1avf1e62OG1GaqJg==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "win32"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-win32-ia32-msvc": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-win32-ia32-msvc/-/swc-win32-ia32-msvc-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-zNaxaO+Kl/xNz02E9QlcVz0pT4MjkXGDLb25qxtAzyJL15aU0+VjjbIZAYWctG59dvggNIUNDWgoBeVTKB9xLg==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "ia32"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "win32"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@next/swc-win32-x64-msvc": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@next/swc-win32-x64-msvc/-/swc-win32-x64-msvc-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-FFOGGWwTCRMu9W7MF496Urefxtuo2lttxF1vwS+1rIRsKvuLrWhVaVTj3T8sf2EBL6gtJbmh4TYlizS+obnGKA==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "win32"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@nodelib/fs.scandir": {[m
[32m+[m[32m      "version": "2.1.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-vq24Bq3ym5HEQm2NKCr3yXDwjc7vTsEThRDnkp2DK9p1uqLR+DHurm/NOTo0KG7HYHU7eppKZj3MyqYuMBf62g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@nodelib/fs.stat": "2.0.5",[m
[32m+[m[32m        "run-parallel": "^1.1.9"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@nodelib/fs.stat": {[m
[32m+[m[32m      "version": "2.0.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-RkhPPp2zrqDAQA/2jNhnztcPAlv64XdhIp7a7454A5ovI7Bukxgt7MX7udwAu3zg1DcpPU0rz3VV1SeaqvY4+A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@nodelib/fs.walk": {[m
[32m+[m[32m      "version": "1.2.8",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz",[m
[32m+[m[32m      "integrity": "sha512-oGB+UxlgWcgQkgwo8GcEGwemoTFt3FIO9ababBmaGwXIoBKZ+GTy0pP185beGg7Llih/NSHSV2XAs1lnznocSg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@nodelib/fs.scandir": "2.1.5",[m
[32m+[m[32m        "fastq": "^1.6.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@popperjs/core": {[m
[32m+[m[32m      "version": "2.11.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@popperjs/core/-/core-2.11.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-50/17A98tWUfQ176raKiOGXuYpLyyVMkxxG6oylzL3BPOlA6ADGdK7EYunSa4I064xerltq9TGXs8HmOk5E+vw==",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/popperjs"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@react-aria/ssr": {[m
[32m+[m[32m      "version": "3.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@react-aria/ssr/-/ssr-3.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-qzuGk14/fUyUAoW/EBwgFcuMkVNXJVGlezTgZ1HovpCZ+p9844E7MUFHE7CuzFzPEIkVeqhBNIoIu+VJJ8YCOA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.6.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": "^16.8.0 || ^17.0.0-rc.1 || ^18.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@restart/hooks": {[m
[32m+[m[32m      "version": "0.4.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@restart/hooks/-/hooks-0.4.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZbjlEHcG+FQtpDPHd7i4FzNNvJf2enAwZfJbpM8CW7BhmOAbsHpZe3tsHwfQUrBuyrxWqPYp2x5UMnilWcY22A==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "dequal": "^2.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": ">=16.8.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@restart/ui": {[m
[32m+[m[32m      "version": "1.4.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@restart/ui/-/ui-1.4.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-J7wFOx2DcmkBqCqiZgDsggLO7faiNh4Nv1/v80FmbRgP+MYpwaVDKKXLC69DA4+ejgNIsBP5ORtC74EZqO1j8A==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.18.3",[m
[32m+[m[32m        "@popperjs/core": "^2.11.5",[m
[32m+[m[32m        "@react-aria/ssr": "^3.2.0",[m
[32m+[m[32m        "@restart/hooks": "^0.4.7",[m
[32m+[m[32m        "@types/warning": "^3.0.0",[m
[32m+[m[32m        "dequal": "^2.0.2",[m
[32m+[m[32m        "dom-helpers": "^5.2.0",[m
[32m+[m[32m        "uncontrollable": "^7.2.1",[m
[32m+[m[32m        "warning": "^4.0.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": ">=16.14.0",[m
[32m+[m[32m        "react-dom": ">=16.14.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@rushstack/eslint-patch": {[m
[32m+[m[32m      "version": "1.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@rushstack/eslint-patch/-/eslint-patch-1.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-sXo/qW2/pAcmT43VoRKOJbDOfV3cYpq3szSVfIThQXNt+E4DfKj361vaAt3c88U5tPUxzEswam7GW48PJqtKAg==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@swc/helpers": {[m
[32m+[m[32m      "version": "0.4.11",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@swc/helpers/-/helpers-0.4.11.tgz",[m
[32m+[m[32m      "integrity": "sha512-rEUrBSGIoSFuYxwBYtlUFMlE2CwGhmW+w9355/5oduSw8e5h2+Tj4UrAGNNgP9915++wj5vkQo0UuOBqOAq4nw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "tslib": "^2.4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@types/cookie": {[m
[32m+[m[32m      "version": "0.4.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/cookie/-/cookie-0.4.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-XW/Aa8APYr6jSVVA1y/DEIZX0/GMKLEVekNG727R8cs56ahETkRAy/3DR7+fJyh7oUgGwNQaRfXCun0+KbWY7Q=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@types/json5": {[m
[32m+[m[32m      "version": "0.0.29",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/json5/-/json5-0.0.29.tgz",[m
[32m+[m[32m      "integrity": "sha512-dRLjCWHYg4oaA77cxO64oO+7JwCwnIzkZPdrrC71jQmQtlhM556pwKo5bUzqvZndkVbeFLIIi+9TC40JNF5hNQ==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@types/node": {[m
[32m+[m[32m      "version": "18.11.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/node/-/node-18.11.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-LhFTglglr63mNXUSRYD8A+ZAIu5sFqNJ4Y2fPuY7UlrySJH87rRRlhtVmMHplmfk5WkoJGmDjE9oiTfyX94CpQ==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@types/prop-types": {[m
[32m+[m[32m      "version": "15.7.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/prop-types/-/prop-types-15.7.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-JCB8C6SnDoQf0cNycqd/35A7MjcnK+ZTqE7judS6o7utxUCg6imJg3QK2qzHKszlTjcj2cn+NwMB2i96ubpj7w=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@types/react": {[m
[32m+[m[32m      "version": "18.0.24",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/react/-/react-18.0.24.tgz",[m
[32m+[m[32m      "integrity": "sha512-wRJWT6ouziGUy+9uX0aW4YOJxAY0bG6/AOk5AW5QSvZqI7dk6VBIbXvcVgIw/W5Jrl24f77df98GEKTJGOLx7Q==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/prop-types": "*",[m
[32m+[m[32m        "@types/scheduler": "*",[m
[32m+[m[32m        "csstype": "^3.0.2"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@types/react-dom": {[m
[32m+[m[32m      "version": "18.0.8",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/react-dom/-/react-dom-18.0.8.tgz",[m
[32m+[m[32m      "integrity": "sha512-C3GYO0HLaOkk9dDAz3Dl4sbe4AKUGTCfFIZsz3n/82dPNN8Du533HzKatDxeUYWu24wJgMP1xICqkWk1YOLOIw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/react": "*"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@types/react-transition-group": {[m
[32m+[m[32m      "version": "4.4.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/react-transition-group/-/react-transition-group-4.4.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-juKD/eiSM3/xZYzjuzH6ZwpP+/lejltmiS3QEzV/vmb/Q8+HfDmxu+Baga8UEMGBqV88Nbg4l2hY/K2DkyaLLA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/react": "*"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@types/scheduler": {[m
[32m+[m[32m      "version": "0.16.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/scheduler/-/scheduler-0.16.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-hppQEBDmlwhFAXKJX2KnWLYu5yMfi91yazPb2l+lbJiwW+wdo1gNeRA+3RgNSO39WYX2euey41KEwnqesU2Jew=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@types/warning": {[m
[32m+[m[32m      "version": "3.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/warning/-/warning-3.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-t/Tvs5qR47OLOr+4E9ckN8AmP2Tf16gWq+/qA4iUGS/OOyHVO8wv2vjJuX8SNOUTJyWb+2t7wJm6cXILFnOROA=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@typescript-eslint/parser": {[m
[32m+[m[32m      "version": "5.41.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@typescript-eslint/parser/-/parser-5.41.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-HQVfix4+RL5YRWZboMD1pUfFN8MpRH4laziWkkAzyO1fvNOY/uinZcvo3QiFJVS/siNHupV8E5+xSwQZrl6PZA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@typescript-eslint/scope-manager": "5.41.0",[m
[32m+[m[32m        "@typescript-eslint/types": "5.41.0",[m
[32m+[m[32m        "@typescript-eslint/typescript-estree": "5.41.0",[m
[32m+[m[32m        "debug": "^4.3.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.22.0 || ^14.17.0 || >=16.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/typescript-eslint"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "eslint": "^6.0.0 || ^7.0.0 || ^8.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "typescript": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@typescript-eslint/scope-manager": {[m
[32m+[m[32m      "version": "5.41.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@typescript-eslint/scope-manager/-/scope-manager-5.41.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-xOxPJCnuktUkY2xoEZBKXO5DBCugFzjrVndKdUnyQr3+9aDWZReKq9MhaoVnbL+maVwWJu/N0SEtrtEUNb62QQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@typescript-eslint/types": "5.41.0",[m
[32m+[m[32m        "@typescript-eslint/visitor-keys": "5.41.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.22.0 || ^14.17.0 || >=16.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/typescript-eslint"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@typescript-eslint/types": {[m
[32m+[m[32m      "version": "5.41.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@typescript-eslint/types/-/types-5.41.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-5BejraMXMC+2UjefDvrH0Fo/eLwZRV6859SXRg+FgbhA0R0l6lDqDGAQYhKbXhPN2ofk2kY5sgGyLNL907UXpA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.22.0 || ^14.17.0 || >=16.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/typescript-eslint"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@typescript-eslint/typescript-estree": {[m
[32m+[m[32m      "version": "5.41.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@typescript-eslint/typescript-estree/-/typescript-estree-5.41.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-SlzFYRwFSvswzDSQ/zPkIWcHv8O5y42YUskko9c4ki+fV6HATsTODUPbRbcGDFYP86gaJL5xohUEytvyNNcXWg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@typescript-eslint/types": "5.41.0",[m
[32m+[m[32m        "@typescript-eslint/visitor-keys": "5.41.0",[m
[32m+[m[32m        "debug": "^4.3.4",[m
[32m+[m[32m        "globby": "^11.1.0",[m
[32m+[m[32m        "is-glob": "^4.0.3",[m
[32m+[m[32m        "semver": "^7.3.7",[m
[32m+[m[32m        "tsutils": "^3.21.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.22.0 || ^14.17.0 || >=16.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/typescript-eslint"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "typescript": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@typescript-eslint/visitor-keys": {[m
[32m+[m[32m      "version": "5.41.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@typescript-eslint/visitor-keys/-/visitor-keys-5.41.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-vilqeHj267v8uzzakbm13HkPMl7cbYpKVjgFWZPIOHIJHZtinvypUhJ5xBXfWYg4eFKqztbMMpOgFpT9Gfx4fw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@typescript-eslint/types": "5.41.0",[m
[32m+[m[32m        "eslint-visitor-keys": "^3.3.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.22.0 || ^14.17.0 || >=16.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/typescript-eslint"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/acorn": {[m
[32m+[m[32m      "version": "8.8.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/acorn/-/acorn-8.8.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-7zFpHzhnqYKrkYdUjF1HI1bzd0VygEGX8lFk4k5zVMqHEoES+P+7TKI+EvLO9WVMJ8eekdO0aDEK044xTXwPPA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "acorn": "bin/acorn"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/acorn-jsx": {[m
[32m+[m[32m      "version": "5.3.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/acorn-jsx/-/acorn-jsx-5.3.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-rq9s+JNhf0IChjtDXxllJ7g41oZk5SlXtp0LHwyA5cejwn7vKmKp4pPri6YEePv2PU65sAsegbXtIinmDFDXgQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "acorn": "^6.0.0 || ^7.0.0 || ^8.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/ajv": {[m
[32m+[m[32m      "version": "6.12.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ajv/-/ajv-6.12.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-j3fVLgvTo527anyYyJOGTYJbG+vnnQYvE0m5mmkc1TK+nxAppkCLMIL0aZ4dblVCNoGShhm+kzE4ZUykBoMg4g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "fast-deep-equal": "^3.1.1",[m
[32m+[m[32m        "fast-json-stable-stringify": "^2.0.0",[m
[32m+[m[32m        "json-schema-traverse": "^0.4.1",[m
[32m+[m[32m        "uri-js": "^4.2.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/epoberezkin"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/ansi-regex": {[m
[32m+[m[32m      "version": "5.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-quJQXlTSUGL2LH9SUXo8VwsY4soanhgo6LNSm84E1LBcE8s3O0wpdiRzyR9z/ZZJMlMWv37qOOb9pdJlMUEKFQ==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/ansi-styles": {[m
[32m+[m[32m      "version": "4.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-zbB9rCJAT1rbjiVDb2hqKFHNYLxgtk8NURxZ3IZwD3F6NtxbXZQCnnSi1Lkx+IDohdPlFp222wVALIheZJQSEg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "color-convert": "^2.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/chalk/ansi-styles?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/argparse": {[m
[32m+[m[32m      "version": "2.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/argparse/-/argparse-2.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-8+9WqebbFzpX9OR+Wa6O29asIogeRMzcGtAINdpMHHyAg10f05aSFVBbcEqGf/PXw1EjAZ+q2/bEBg3DvurK3Q==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/aria-query": {[m
[32m+[m[32m      "version": "4.2.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/aria-query/-/aria-query-4.2.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-o/HelwhuKpTj/frsOsbNLNgnNGVIFsVP/SW2BSF14gVl7kAfMOJ6/8wUAUvG1R1NHKrfG+2sHZTu0yauT1qBrA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.10.2",[m
[32m+[m[32m        "@babel/runtime-corejs3": "^7.10.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/array-includes": {[m
[32m+[m[32m      "version": "3.1.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/array-includes/-/array-includes-3.1.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-iSDYZMMyTPkiFasVqfuAQnWAYcvO/SeBSCGKePoEthjp4LEMTe4uLc7b025o4jAZpHhihh8xPo99TNWUWWkGDQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "define-properties": "^1.1.4",[m
[32m+[m[32m        "es-abstract": "^1.19.5",[m
[32m+[m[32m        "get-intrinsic": "^1.1.1",[m
[32m+[m[32m        "is-string": "^1.0.7"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/array-union": {[m
[32m+[m[32m      "version": "2.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/array-union/-/array-union-2.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-HGyxoOTYUyCM6stUe6EJgnd4EoewAI7zMdfqO+kGjnlZmBDz/cR5pf8r/cR4Wq60sL/p0IkcjUEEPwS3GFrIyw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/array.prototype.flat": {[m
[32m+[m[32m      "version": "1.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/array.prototype.flat/-/array.prototype.flat-1.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-12IUEkHsAhA4DY5s0FPgNXIdc8VRSqD9Zp78a5au9abH/SOBrsp082JOWFNTjkMozh8mqcdiKuaLGhPeYztxSw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "define-properties": "^1.1.3",[m
[32m+[m[32m        "es-abstract": "^1.19.2",[m
[32m+[m[32m        "es-shim-unscopables": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/array.prototype.flatmap": {[m
[32m+[m[32m      "version": "1.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/array.prototype.flatmap/-/array.prototype.flatmap-1.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-PZC9/8TKAIxcWKdyeb77EzULHPrIX/tIZebLJUQOMR1OwYosT8yggdfWScfTBCDj5utONvOuPQQumYsU2ULbkg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "define-properties": "^1.1.3",[m
[32m+[m[32m        "es-abstract": "^1.19.2",[m
[32m+[m[32m        "es-shim-unscopables": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/ast-types-flow": {[m
[32m+[m[32m      "version": "0.0.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ast-types-flow/-/ast-types-flow-0.0.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-eBvWn1lvIApYMhzQMsu9ciLfkBY499mFZlNqG+/9WR7PVlroQw0vG30cOQQbaKz3sCEc44TAOu2ykzqXSNnwag==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/astral-regex": {[m
[32m+[m[32m      "version": "2.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/astral-regex/-/astral-regex-2.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Z7tMw1ytTXt5jqMcOP+OQteU1VuNK9Y02uuJtKQ1Sv69jXQKKg5cibLwGJow8yzZP+eAc18EmLGPal0bp36rvQ==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/axe-core": {[m
[32m+[m[32m      "version": "4.5.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/axe-core/-/axe-core-4.5.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-4+rr8eQ7+XXS5nZrKcMO/AikHL0hVqy+lHWAnE3xdHl+aguag8SOQ6eEqLexwLNWgXIMfunGuD3ON1/6Kyet0A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/axobject-query": {[m
[32m+[m[32m      "version": "2.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/axobject-query/-/axobject-query-2.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Td525n+iPOOyUQIeBfcASuG6uJsDOITl7Mds5gFyerkWiX7qhUTdYUBlSgNMyVqtSJqwpt1kXGLdUt6SykLMRA==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/balanced-match": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-3oSeUO0TMV67hN1AmbXsK4yaqU7tjiHlbxRDZOpH0KW9+CeX4bRAaX0Anxt0tx2MrpRpWwQaPwIlISEJhYU5Pw==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/bootstrap": {[m
[32m+[m[32m      "version": "5.2.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/bootstrap/-/bootstrap-5.2.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-cEKPM+fwb3cT8NzQZYEu4HilJ3anCrWqh3CHAok1p9jXqMPsPTBhU25fBckEJHJ/p+tTxTFTsFQGM+gaHpi3QQ==",[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "github",[m
[32m+[m[32m          "url": "https://github.com/sponsors/twbs"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "opencollective",[m
[32m+[m[32m          "url": "https://opencollective.com/bootstrap"[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@popperjs/core": "^2.11.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/brace-expansion": {[m
[32m+[m[32m      "version": "1.1.11",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz",[m
[32m+[m[32m      "integrity": "sha512-iCuPHDFgrHX7H2vEI/5xpz07zSHB00TpugqhmYtVmMO6518mCuRMoOYFldEBl0g187ufozdaHgWKcYFb61qGiA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "balanced-match": "^1.0.0",[m
[32m+[m[32m        "concat-map": "0.0.1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/braces": {[m
[32m+[m[32m      "version": "3.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/braces/-/braces-3.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-b8um+L1RzM3WDSzvhm6gIz1yfTbBt6YTlcEKAvsmqCZZFw46z626lVj9j1yEPW33H5H+lBQpZMP1k8l+78Ha0A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "fill-range": "^7.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/call-bind": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/call-bind/-/call-bind-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-7O+FbCihrB5WGbFYesctwmTKae6rOiIzmz1icreWJ+0aA7LJfuqhEso2T9ncpcFtzMQtzXf2QGGueWJGTYsqrA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "function-bind": "^1.1.1",[m
[32m+[m[32m        "get-intrinsic": "^1.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/callsites": {[m
[32m+[m[32m      "version": "3.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/callsites/-/callsites-3.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-P8BjAsXvZS+VIDUI11hHCQEv74YT67YUi5JJFNWIqL235sBmjX4+qx9Muvls5ivyNENctx46xQLQ3aTuE7ssaQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/caniuse-lite": {[m
[32m+[m[32m      "version": "1.0.30001426",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001426.tgz",[m
[32m+[m[32m      "integrity": "sha512-n7cosrHLl8AWt0wwZw/PJZgUg3lV0gk9LMI7ikGJwhyhgsd2Nb65vKvmSexCqq/J7rbH3mFG6yZZiPR5dLPW5A==",[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "opencollective",[m
[32m+[m[32m          "url": "https://opencollective.com/browserslist"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "tidelift",[m
[32m+[m[32m          "url": "https://tidelift.com/funding/github/npm/caniuse-lite"[m
[32m+[m[32m        }[m
[32m+[m[32m      ][m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/chalk": {[m
[32m+[m[32m      "version": "4.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/chalk/-/chalk-4.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-oKnbhFyRIXpUuez8iBMmyEa4nbj4IOQyuhc/wy9kY7/WVPcwIO9VA668Pu8RkO7+0G76SLROeyw9CpQ061i4mA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "ansi-styles": "^4.1.0",[m
[32m+[m[32m        "supports-color": "^7.1.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/chalk/chalk?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/classnames": {[m
[32m+[m[32m      "version": "2.3.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/classnames/-/classnames-2.3.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-CSbhY4cFEJRe6/GQzIk5qXZ4Jeg5pcsP7b5peFSDpffpe1cqjASH/n9UTjBwOp6XpMSTwQ8Za2K5V02ueA7Tmw=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/client-only": {[m
[32m+[m[32m      "version": "0.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/client-only/-/client-only-0.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-IV3Ou0jSMzZrd3pZ48nLkT9DA7Ag1pnPzaiQhpW7c3RbcqqzvzzVu+L8gfqMp/8IM2MQtSiqaCxrrcfu8I8rMA=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/color-convert": {[m
[32m+[m[32m      "version": "2.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-RRECPsj7iu/xb5oKYcsFHSppFNnsj/52OVTRKb4zP5onXwVF3zVmmToNcOfGC+CRDpfK/U584fMg38ZHCaElKQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "color-name": "~1.1.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=7.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/color-name": {[m
[32m+[m[32m      "version": "1.1.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-dOy+3AuW3a2wNbZHIuMZpTcgjGuLU/uBL/ubcZF9OXbDo8ff4O8yVp5Bf0efS8uEoYo5q4Fx7dY9OgQGXgAsQA=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/concat-map": {[m
[32m+[m[32m      "version": "0.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-/Srv4dswyQNBfohGpz9o6Yb3Gz3SrUDqBH5rTuhGR7ahtlbYKnVxw2bCFMRljaA7EXHaXZ8wsHdodFvbkhKmqg==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/cookie": {[m
[32m+[m[32m      "version": "0.4.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/cookie/-/cookie-0.4.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-aSWTXFzaKWkvHO1Ny/s+ePFpvKsPnjc551iI41v3ny/ow6tBG5Vd+FuqGNhh1LxOmVzOlGUriIlOaokOvhaStA==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/cookies-next": {[m
[32m+[m[32m      "version": "2.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/cookies-next/-/cookies-next-2.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-AZGZPdL1hU3jCjN2UMJTGhLOYzNUN9Gm+v8BdptYIHUdwz397Et1p+sZRfvAl8pKnnmMdX2Pk9xDRKCGBum6GA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/cookie": "^0.4.1",[m
[32m+[m[32m        "@types/node": "^16.10.2",[m
[32m+[m[32m        "cookie": "^0.4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/cookies-next/node_modules/@types/node": {[m
[32m+[m[32m      "version": "16.18.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/node/-/node-16.18.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-jh6m0QUhIRcZpNv7Z/rpN+ZWXOicUUQbSoWks7Htkbb9IjFQj4kzcX/xFCkjstCj5flMsN8FiSvt+q+Tcs4Llg=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/core-js-pure": {[m
[32m+[m[32m      "version": "3.26.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/core-js-pure/-/core-js-pure-3.26.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-LiN6fylpVBVwT8twhhluD9TzXmZQQsr2I2eIKtWNbZI1XMfBT7CV18itaN6RA7EtQd/SDdRx/wzvAShX2HvhQA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "hasInstallScript": true,[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/core-js"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/cross-spawn": {[m
[32m+[m[32m      "version": "7.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-iRDPJKUPVEND7dHPO8rkbOnPpyDygcDFtWjpeWNCgy8WP2rXcxXL8TskReQl6OrB2G7+UJrags1q15Fudc7G6w==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "path-key": "^3.1.0",[m
[32m+[m[32m        "shebang-command": "^2.0.0",[m
[32m+[m[32m        "which": "^2.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/csstype": {[m
[32m+[m[32m      "version": "3.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/csstype/-/csstype-3.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-DJR/VvkAvSZW9bTouZue2sSxDwdTN92uHjqeKVm+0dAqdfNykRzQ95tay8aXMBAAPpUiq4Qcug2L7neoRh2Egw=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/damerau-levenshtein": {[m
[32m+[m[32m      "version": "1.0.8",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/damerau-levenshtein/-/damerau-levenshtein-1.0.8.tgz",[m
[32m+[m[32m      "integrity": "sha512-sdQSFB7+llfUcQHUQO3+B8ERRj0Oa4w9POWMI/puGtuf7gFywGmkaLCElnudfTiKZV+NvHqL0ifzdrI8Ro7ESA==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/debug": {[m
[32m+[m[32m      "version": "4.3.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/debug/-/debug-4.3.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-PRWFHuSU3eDtQJPvnNY7Jcket1j0t5OuOsFzPPzsekD52Zl8qUfFIPEiswXqIvHWGVHOgX+7G/vCNNhehwxfkQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "ms": "2.1.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "supports-color": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/deep-is": {[m
[32m+[m[32m      "version": "0.1.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/deep-is/-/deep-is-0.1.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-oIPzksmTg4/MriiaYGO+okXDT7ztn/w3Eptv/+gSIdMdKsJo0u4CfYNFJPy+4SKMuCqGw2wxnA+URMg3t8a/bQ==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/define-properties": {[m
[32m+[m[32m      "version": "1.1.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/define-properties/-/define-properties-1.1.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-uckOqKcfaVvtBdsVkdPv3XjveQJsNQqmhXgRi8uhvWWuPYZCNlzT8qAyblUgNoXdHdjMTzAqeGjAoli8f+bzPA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "has-property-descriptors": "^1.0.0",[m
[32m+[m[32m        "object-keys": "^1.1.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/dequal": {[m
[32m+[m[32m      "version": "2.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/dequal/-/dequal-2.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-0je+qPKHEMohvfRTCEo3CrPG6cAzAYgmzKyxRiYSSDkS6eGJdyVJm7WaYA5ECaAD9wLB2T4EEeymA5aFVcYXCA==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/dir-glob": {[m
[32m+[m[32m      "version": "3.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/dir-glob/-/dir-glob-3.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-WkrWp9GR4KXfKGYzOLmTuGVi1UWFfws377n9cc55/tb6DuqyF6pcQ5AbiHEshaDpY9v6oaSr2XCDidGmMwdzIA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "path-type": "^4.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/doctrine": {[m
[32m+[m[32m      "version": "3.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/doctrine/-/doctrine-3.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-yS+Q5i3hBf7GBkd4KG8a7eBNNWNGLTaEwwYWUijIYM7zrlYDM0BFXHjjPWlWZ1Rg7UaddZeIDmi9jF3HmqiQ2w==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "esutils": "^2.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/dom-helpers": {[m
[32m+[m[32m      "version": "5.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/dom-helpers/-/dom-helpers-5.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-nRCa7CK3VTrM2NmGkIy4cbK7IZlgBE/PYMn55rrXefr5xXDP0LdtfPnblFDoVdcAfslJ7or6iqAUnx0CCGIWQA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.8.7",[m
[32m+[m[32m        "csstype": "^3.0.2"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/emoji-regex": {[m
[32m+[m[32m      "version": "9.2.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/emoji-regex/-/emoji-regex-9.2.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-L18DaJsXSUk2+42pv8mLs5jJT2hqFkFE4j21wOmgbUqsZ2hL72NsUU785g9RXgo3s0ZNgVl42TiHp3ZtOv/Vyg==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/es-abstract": {[m
[32m+[m[32m      "version": "1.20.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/es-abstract/-/es-abstract-1.20.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-0UtvRN79eMe2L+UNEF1BwRe364sj/DXhQ/k5FmivgoSdpM90b8Jc0mDzKMGo7QS0BVbOP/bTwBKNnDc9rNzaPA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "es-to-primitive": "^1.2.1",[m
[32m+[m[32m        "function-bind": "^1.1.1",[m
[32m+[m[32m        "function.prototype.name": "^1.1.5",[m
[32m+[m[32m        "get-intrinsic": "^1.1.3",[m
[32m+[m[32m        "get-symbol-description": "^1.0.0",[m
[32m+[m[32m        "has": "^1.0.3",[m
[32m+[m[32m        "has-property-descriptors": "^1.0.0",[m
[32m+[m[32m        "has-symbols": "^1.0.3",[m
[32m+[m[32m        "internal-slot": "^1.0.3",[m
[32m+[m[32m        "is-callable": "^1.2.7",[m
[32m+[m[32m        "is-negative-zero": "^2.0.2",[m
[32m+[m[32m        "is-regex": "^1.1.4",[m
[32m+[m[32m        "is-shared-array-buffer": "^1.0.2",[m
[32m+[m[32m        "is-string": "^1.0.7",[m
[32m+[m[32m        "is-weakref": "^1.0.2",[m
[32m+[m[32m        "object-inspect": "^1.12.2",[m
[32m+[m[32m        "object-keys": "^1.1.1",[m
[32m+[m[32m        "object.assign": "^4.1.4",[m
[32m+[m[32m        "regexp.prototype.flags": "^1.4.3",[m
[32m+[m[32m        "safe-regex-test": "^1.0.0",[m
[32m+[m[32m        "string.prototype.trimend": "^1.0.5",[m
[32m+[m[32m        "string.prototype.trimstart": "^1.0.5",[m
[32m+[m[32m        "unbox-primitive": "^1.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/es-shim-unscopables": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/es-shim-unscopables/-/es-shim-unscopables-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Jm6GPcCdC30eMLbZ2x8z2WuRwAws3zTBBKuusffYVUrNj/GVSUAZ+xKMaUpfNDR5IbyNA5LJbaecoUVbmUcB1w==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "has": "^1.0.3"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/es-to-primitive": {[m
[32m+[m[32m      "version": "1.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/es-to-primitive/-/es-to-primitive-1.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-QCOllgZJtaUo9miYBcLChTUaHNjJF3PYs1VidD7AwiEj1kYxKeQTctLAezAOH5ZKRH0g2IgPn6KwB4IT8iRpvA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "is-callable": "^1.1.4",[m
[32m+[m[32m        "is-date-object": "^1.0.1",[m
[32m+[m[32m        "is-symbol": "^1.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/escape-string-regexp": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-TtpcNJ3XAzx3Gq8sWRzJaVajRs0uVxA2YAkdb1jm2YkPz4G6egUFAyA3n5vtEIZefPk5Wa4UXbKuS5fKkJWdgA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/sindresorhus"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint": {[m
[32m+[m[32m      "version": "8.26.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint/-/eslint-8.26.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-kzJkpaw1Bfwheq4VXUezFriD1GxszX6dUekM7Z3aC2o4hju+tsR/XyTC3RcoSD7jmy9VkPU3+N6YjVU2e96Oyg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@eslint/eslintrc": "^1.3.3",[m
[32m+[m[32m        "@humanwhocodes/config-array": "^0.11.6",[m
[32m+[m[32m        "@humanwhocodes/module-importer": "^1.0.1",[m
[32m+[m[32m        "@nodelib/fs.walk": "^1.2.8",[m
[32m+[m[32m        "ajv": "^6.10.0",[m
[32m+[m[32m        "chalk": "^4.0.0",[m
[32m+[m[32m        "cross-spawn": "^7.0.2",[m
[32m+[m[32m        "debug": "^4.3.2",[m
[32m+[m[32m        "doctrine": "^3.0.0",[m
[32m+[m[32m        "escape-string-regexp": "^4.0.0",[m
[32m+[m[32m        "eslint-scope": "^7.1.1",[m
[32m+[m[32m        "eslint-utils": "^3.0.0",[m
[32m+[m[32m        "eslint-visitor-keys": "^3.3.0",[m
[32m+[m[32m        "espree": "^9.4.0",[m
[32m+[m[32m        "esquery": "^1.4.0",[m
[32m+[m[32m        "esutils": "^2.0.2",[m
[32m+[m[32m        "fast-deep-equal": "^3.1.3",[m
[32m+[m[32m        "file-entry-cache": "^6.0.1",[m
[32m+[m[32m        "find-up": "^5.0.0",[m
[32m+[m[32m        "glob-parent": "^6.0.2",[m
[32m+[m[32m        "globals": "^13.15.0",[m
[32m+[m[32m        "grapheme-splitter": "^1.0.4",[m
[32m+[m[32m        "ignore": "^5.2.0",[m
[32m+[m[32m        "import-fresh": "^3.0.0",[m
[32m+[m[32m        "imurmurhash": "^0.1.4",[m
[32m+[m[32m        "is-glob": "^4.0.0",[m
[32m+[m[32m        "is-path-inside": "^3.0.3",[m
[32m+[m[32m        "js-sdsl": "^4.1.4",[m
[32m+[m[32m        "js-yaml": "^4.1.0",[m
[32m+[m[32m        "json-stable-stringify-without-jsonify": "^1.0.1",[m
[32m+[m[32m        "levn": "^0.4.1",[m
[32m+[m[32m        "lodash.merge": "^4.6.2",[m
[32m+[m[32m        "minimatch": "^3.1.2",[m
[32m+[m[32m        "natural-compare": "^1.4.0",[m
[32m+[m[32m        "optionator": "^0.9.1",[m
[32m+[m[32m        "regexpp": "^3.2.0",[m
[32m+[m[32m        "strip-ansi": "^6.0.1",[m
[32m+[m[32m        "strip-json-comments": "^3.1.0",[m
[32m+[m[32m        "text-table": "^0.2.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "eslint": "bin/eslint.js"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.22.0 || ^14.17.0 || >=16.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://opencollective.com/eslint"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-config-next": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-config-next/-/eslint-config-next-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-y2nqWS2tycWySdVhb+rhp6CuDmDazGySqkzzQZf3UTyfHyC7og1m5m/AtMFwCo5mtvDqvw1BENin52kV9733lg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@next/eslint-plugin-next": "13.0.0",[m
[32m+[m[32m        "@rushstack/eslint-patch": "^1.1.3",[m
[32m+[m[32m        "@typescript-eslint/parser": "^5.21.0",[m
[32m+[m[32m        "eslint-import-resolver-node": "^0.3.6",[m
[32m+[m[32m        "eslint-import-resolver-typescript": "^2.7.1",[m
[32m+[m[32m        "eslint-plugin-import": "^2.26.0",[m
[32m+[m[32m        "eslint-plugin-jsx-a11y": "^6.5.1",[m
[32m+[m[32m        "eslint-plugin-react": "^7.31.7",[m
[32m+[m[32m        "eslint-plugin-react-hooks": "^4.5.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "eslint": "^7.23.0 || ^8.0.0",[m
[32m+[m[32m        "typescript": ">=3.3.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "typescript": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-import-resolver-node": {[m
[32m+[m[32m      "version": "0.3.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-0En0w03NRVMn9Uiyn8YRPDKvWjxCWkslUEhGNTdGx15RvPJYQ+lbOlqrlNI2vEAs4pDYK4f/HN2TbDmk5TP0iw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "debug": "^3.2.7",[m
[32m+[m[32m        "resolve": "^1.20.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-import-resolver-node/node_modules/debug": {[m
[32m+[m[32m      "version": "3.2.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/debug/-/debug-3.2.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-CFjzYYAi4ThfiQvizrFQevTTXHtnCqWfe7x1AhgEscTz6ZbLbfoLRLPugTQyBth6f8ZERVUSyWHFD/7Wu4t1XQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "ms": "^2.1.1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-import-resolver-typescript": {[m
[32m+[m[32m      "version": "2.7.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-import-resolver-typescript/-/eslint-import-resolver-typescript-2.7.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-00UbgGwV8bSgUv34igBDbTOtKhqoRMy9bFjNehT40bXg6585PNIct8HhXZ0SybqB9rWtXj9crcku8ndDn/gIqQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "debug": "^4.3.4",[m
[32m+[m[32m        "glob": "^7.2.0",[m
[32m+[m[32m        "is-glob": "^4.0.3",[m
[32m+[m[32m        "resolve": "^1.22.0",[m
[32m+[m[32m        "tsconfig-paths": "^3.14.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "eslint": "*",[m
[32m+[m[32m        "eslint-plugin-import": "*"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-module-utils": {[m
[32m+[m[32m      "version": "2.7.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-module-utils/-/eslint-module-utils-2.7.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-j4GT+rqzCoRKHwURX7pddtIPGySnX9Si/cgMI5ztrcqOPtk5dDEeZ34CQVPphnqkJytlc97Vuk05Um2mJ3gEQA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "debug": "^3.2.7"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "eslint": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-module-utils/node_modules/debug": {[m
[32m+[m[32m      "version": "3.2.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/debug/-/debug-3.2.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-CFjzYYAi4ThfiQvizrFQevTTXHtnCqWfe7x1AhgEscTz6ZbLbfoLRLPugTQyBth6f8ZERVUSyWHFD/7Wu4t1XQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "ms": "^2.1.1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-plugin-import": {[m
[32m+[m[32m      "version": "2.26.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-plugin-import/-/eslint-plugin-import-2.26.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-hYfi3FXaM8WPLf4S1cikh/r4IxnO6zrhZbEGz2b660EJRbuxgpDS5gkCuYgGWg2xxh2rBuIr4Pvhve/7c31koA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "array-includes": "^3.1.4",[m
[32m+[m[32m        "array.prototype.flat": "^1.2.5",[m
[32m+[m[32m        "debug": "^2.6.9",[m
[32m+[m[32m        "doctrine": "^2.1.0",[m
[32m+[m[32m        "eslint-import-resolver-node": "^0.3.6",[m
[32m+[m[32m        "eslint-module-utils": "^2.7.3",[m
[32m+[m[32m        "has": "^1.0.3",[m
[32m+[m[32m        "is-core-module": "^2.8.1",[m
[32m+[m[32m        "is-glob": "^4.0.3",[m
[32m+[m[32m        "minimatch": "^3.1.2",[m
[32m+[m[32m        "object.values": "^1.1.5",[m
[32m+[m[32m        "resolve": "^1.22.0",[m
[32m+[m[32m        "tsconfig-paths": "^3.14.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "eslint": "^2 || ^3 || ^4 || ^5 || ^6 || ^7.2.0 || ^8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-plugin-import/node_modules/debug": {[m
[32m+[m[32m      "version": "2.6.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/debug/-/debug-2.6.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-bC7ElrdJaJnPbAP+1EotYvqZsb3ecl5wi6Bfi6BJTUcNowp6cvspg0jXznRTKDjm/E7AdgFBVeAPVMNcKGsHMA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "ms": "2.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-plugin-import/node_modules/doctrine": {[m
[32m+[m[32m      "version": "2.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/doctrine/-/doctrine-2.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-35mSku4ZXK0vfCuHEDAwt55dg2jNajHZ1odvF+8SSr82EsZY4QmXfuWso8oEd8zRhVObSN18aM0CjSdoBX7zIw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "esutils": "^2.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-plugin-import/node_modules/ms": {[m
[32m+[m[32m      "version": "2.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ms/-/ms-2.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Tpp60P6IUJDTuOq/5Z8cdskzJujfwqfOTkrwIwj7IRISpnkJnT6SyJ4PCPnGMoFjC9ddhal5KVIYtAt97ix05A==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-plugin-jsx-a11y": {[m
[32m+[m[32m      "version": "6.6.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-plugin-jsx-a11y/-/eslint-plugin-jsx-a11y-6.6.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-sXgFVNHiWffBq23uiS/JaP6eVR622DqwB4yTzKvGZGcPq6/yZ3WmOZfuBks/vHWo9GaFOqC2ZK4i6+C35knx7Q==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.18.9",[m
[32m+[m[32m        "aria-query": "^4.2.2",[m
[32m+[m[32m        "array-includes": "^3.1.5",[m
[32m+[m[32m        "ast-types-flow": "^0.0.7",[m
[32m+[m[32m        "axe-core": "^4.4.3",[m
[32m+[m[32m        "axobject-query": "^2.2.0",[m
[32m+[m[32m        "damerau-levenshtein": "^1.0.8",[m
[32m+[m[32m        "emoji-regex": "^9.2.2",[m
[32m+[m[32m        "has": "^1.0.3",[m
[32m+[m[32m        "jsx-ast-utils": "^3.3.2",[m
[32m+[m[32m        "language-tags": "^1.0.5",[m
[32m+[m[32m        "minimatch": "^3.1.2",[m
[32m+[m[32m        "semver": "^6.3.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "eslint": "^3 || ^4 || ^5 || ^6 || ^7 || ^8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-plugin-jsx-a11y/node_modules/semver": {[m
[32m+[m[32m      "version": "6.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/semver/-/semver-6.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-b39TBaTSfV6yBrapU89p5fKekE2m/NwnDocOVruQFS1/veMgdzuPcnOM34M6CwxW8jH/lxEa5rBoDeUwu5HHTw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "semver": "bin/semver.js"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-plugin-react": {[m
[32m+[m[32m      "version": "7.31.10",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-plugin-react/-/eslint-plugin-react-7.31.10.tgz",[m
[32m+[m[32m      "integrity": "sha512-e4N/nc6AAlg4UKW/mXeYWd3R++qUano5/o+t+wnWxIf+bLsOaH3a4q74kX3nDjYym3VBN4HyO9nEn1GcAqgQOA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "array-includes": "^3.1.5",[m
[32m+[m[32m        "array.prototype.flatmap": "^1.3.0",[m
[32m+[m[32m        "doctrine": "^2.1.0",[m
[32m+[m[32m        "estraverse": "^5.3.0",[m
[32m+[m[32m        "jsx-ast-utils": "^2.4.1 || ^3.0.0",[m
[32m+[m[32m        "minimatch": "^3.1.2",[m
[32m+[m[32m        "object.entries": "^1.1.5",[m
[32m+[m[32m        "object.fromentries": "^2.0.5",[m
[32m+[m[32m        "object.hasown": "^1.1.1",[m
[32m+[m[32m        "object.values": "^1.1.5",[m
[32m+[m[32m        "prop-types": "^15.8.1",[m
[32m+[m[32m        "resolve": "^2.0.0-next.3",[m
[32m+[m[32m        "semver": "^6.3.0",[m
[32m+[m[32m        "string.prototype.matchall": "^4.0.7"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "eslint": "^3 || ^4 || ^5 || ^6 || ^7 || ^8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-plugin-react-hooks": {[m
[32m+[m[32m      "version": "4.6.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-plugin-react-hooks/-/eslint-plugin-react-hooks-4.6.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-oFc7Itz9Qxh2x4gNHStv3BqJq54ExXmfC+a1NjAta66IAN87Wu0R/QArgIS9qKzX3dXKPI9H5crl9QchNMY9+g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "eslint": "^3.0.0 || ^4.0.0 || ^5.0.0 || ^6.0.0 || ^7.0.0 || ^8.0.0-0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-plugin-react/node_modules/doctrine": {[m
[32m+[m[32m      "version": "2.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/doctrine/-/doctrine-2.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-35mSku4ZXK0vfCuHEDAwt55dg2jNajHZ1odvF+8SSr82EsZY4QmXfuWso8oEd8zRhVObSN18aM0CjSdoBX7zIw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "esutils": "^2.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-plugin-react/node_modules/resolve": {[m
[32m+[m[32m      "version": "2.0.0-next.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/resolve/-/resolve-2.0.0-next.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-iMDbmAWtfU+MHpxt/I5iWI7cY6YVEZUQ3MBgPQ++XD1PELuJHIl82xBmObyP2KyQmkNB2dsqF7seoQQiAn5yDQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "is-core-module": "^2.9.0",[m
[32m+[m[32m        "path-parse": "^1.0.7",[m
[32m+[m[32m        "supports-preserve-symlinks-flag": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "resolve": "bin/resolve"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-plugin-react/node_modules/semver": {[m
[32m+[m[32m      "version": "6.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/semver/-/semver-6.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-b39TBaTSfV6yBrapU89p5fKekE2m/NwnDocOVruQFS1/veMgdzuPcnOM34M6CwxW8jH/lxEa5rBoDeUwu5HHTw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "semver": "bin/semver.js"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-scope": {[m
[32m+[m[32m      "version": "7.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-scope/-/eslint-scope-7.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-QKQM/UXpIiHcLqJ5AOyIW7XZmzjkzQXYE54n1++wb0u9V/abW3l9uQnxX8Z5Xd18xyKIMTUAyQ0k1e8pz6LUrw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "esrecurse": "^4.3.0",[m
[32m+[m[32m        "estraverse": "^5.2.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.22.0 || ^14.17.0 || >=16.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-utils": {[m
[32m+[m[32m      "version": "3.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-utils/-/eslint-utils-3.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-uuQC43IGctw68pJA1RgbQS8/NP7rch6Cwd4j3ZBtgo4/8Flj4eGE7ZYSZRN3iq5pVUv6GPdW5Z1RFleo84uLDA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "eslint-visitor-keys": "^2.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^10.0.0 || ^12.0.0 || >= 14.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/mysticatea"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "eslint": ">=5"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-utils/node_modules/eslint-visitor-keys": {[m
[32m+[m[32m      "version": "2.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-2.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-0rSmRBzXgDzIsD6mGdJgevzgezI534Cer5L/vyMX0kHzT/jiB43jRhd9YUlMGYLQy2zprNmoT8qasCGtY+QaKw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eslint-visitor-keys": {[m
[32m+[m[32m      "version": "3.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-3.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-mQ+suqKJVyeuwGYHAdjMFqjCyfl8+Ldnxuyp3ldiMBFKkvytrXUZWaiPCEav8qDHKty44bD+qV1IP4T+w+xXRA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.22.0 || ^14.17.0 || >=16.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/espree": {[m
[32m+[m[32m      "version": "9.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/espree/-/espree-9.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-DQmnRpLj7f6TgN/NYb0MTzJXL+vJF9h3pHy4JhCIs3zwcgez8xmGg3sXHcEO97BrmO2OSvCwMdfdlyl+E9KjOw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "acorn": "^8.8.0",[m
[32m+[m[32m        "acorn-jsx": "^5.3.2",[m
[32m+[m[32m        "eslint-visitor-keys": "^3.3.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^12.22.0 || ^14.17.0 || >=16.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://opencollective.com/eslint"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/esquery": {[m
[32m+[m[32m      "version": "1.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/esquery/-/esquery-1.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-cCDispWt5vHHtwMY2YrAQ4ibFkAL8RbH5YGBnZBc90MolvvfkkQcJro/aZiAQUlQ3qgrYS6D6v8Gc5G5CQsc9w==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "estraverse": "^5.1.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/esrecurse": {[m
[32m+[m[32m      "version": "4.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/esrecurse/-/esrecurse-4.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-KmfKL3b6G+RXvP8N1vr3Tq1kL/oCFgn2NYXEtqP8/L3pKapUA4G8cFVaoF3SU323CD4XypR/ffioHmkti6/Tag==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "estraverse": "^5.2.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/estraverse": {[m
[32m+[m[32m      "version": "5.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/estraverse/-/estraverse-5.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-MMdARuVEQziNTeJD8DgMqmhwR11BRQ/cBP+pLtYdSTnf3MIO8fFeiINEbX36ZdNlfU/7A9f3gUw49B3oQsvwBA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/esutils": {[m
[32m+[m[32m      "version": "2.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/esutils/-/esutils-2.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-kVscqXk4OCp68SZ0dkgEKVi6/8ij300KBWTJq32P/dYeWTSwK41WyTxalN1eRmA5Z9UU/LX9D7FWSmV9SAYx6g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/fast-deep-equal": {[m
[32m+[m[32m      "version": "3.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-f3qQ9oQy9j2AhBe/H9VC91wLmKBCCU/gDOnKNAYG5hswO7BLKj09Hc5HYNz9cGI++xlpDCIgDaitVs03ATR84Q=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/fast-glob": {[m
[32m+[m[32m      "version": "3.2.12",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/fast-glob/-/fast-glob-3.2.12.tgz",[m
[32m+[m[32m      "integrity": "sha512-DVj4CQIYYow0BlaelwK1pHl5n5cRSJfM60UA0zK891sVInoPri2Ekj7+e1CT3/3qxXenpI+nBBmQAcJPJgaj4w==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@nodelib/fs.stat": "^2.0.2",[m
[32m+[m[32m        "@nodelib/fs.walk": "^1.2.3",[m
[32m+[m[32m        "glob-parent": "^5.1.2",[m
[32m+[m[32m        "merge2": "^1.3.0",[m
[32m+[m[32m        "micromatch": "^4.0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8.6.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/fast-glob/node_modules/glob-parent": {[m
[32m+[m[32m      "version": "5.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-AOIgSQCepiJYwP3ARnGx+5VnTu2HBYdzbGP45eLw1vr3zB3vZLeyed1sC9hnbcOc9/SrMyM5RPQrkGz4aS9Zow==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "is-glob": "^4.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/fast-json-stable-stringify": {[m
[32m+[m[32m      "version": "2.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-lhd/wF+Lk98HZoTCtlVraHtfh5XYijIjalXck7saUtuanSDyLMxnHhSXEDJqHxD7msR8D0uCmqlkwjCV8xvwHw==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/fast-levenshtein": {[m
[32m+[m[32m      "version": "2.0.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-DCXu6Ifhqcks7TZKY3Hxp3y6qphY5SJZmrWMDrKcERSOXWQdMhU9Ig/PYrzyw/ul9jOIyh0N4M0tbC5hodg8dw==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/fastq": {[m
[32m+[m[32m      "version": "1.13.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/fastq/-/fastq-1.13.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-YpkpUnK8od0o1hmeSc7UUs/eB/vIPWJYjKck2QKIzAf71Vm1AAQ3EbuZB3g2JIy+pg+ERD0vqI79KyZiB2e2Nw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "reusify": "^1.0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/file-entry-cache": {[m
[32m+[m[32m      "version": "6.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/file-entry-cache/-/file-entry-cache-6.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-7Gps/XWymbLk2QLYK4NzpMOrYjMhdIxXuIvy2QBsLE6ljuodKvdkWs/cpyJJ3CVIVpH0Oi1Hvg1ovbMzLdFBBg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "flat-cache": "^3.0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^10.12.0 || >=12.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/fill-range": {[m
[32m+[m[32m      "version": "7.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/fill-range/-/fill-range-7.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-qOo9F+dMUmC2Lcb4BbVvnKJxTPjCm+RRpe4gDuGrzkL7mEVl/djYSu2OdQ2Pa302N4oqkSg9ir6jaLWJ2USVpQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "to-regex-range": "^5.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/find-up": {[m
[32m+[m[32m      "version": "5.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/find-up/-/find-up-5.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-78/PXT1wlLLDgTzDs7sjq9hzz0vXD+zn+7wypEe4fXQxCmdmqfGsEPQxmiCSQI3ajFV91bVSsvNtrJRiW6nGng==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "locate-path": "^6.0.0",[m
[32m+[m[32m        "path-exists": "^4.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/sindresorhus"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/flat-cache": {[m
[32m+[m[32m      "version": "3.0.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/flat-cache/-/flat-cache-3.0.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-dm9s5Pw7Jc0GvMYbshN6zchCA9RgQlzzEZX3vylR9IqFfS8XciblUXOKfW6SiuJ0e13eDYZoZV5wdrev7P3Nwg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "flatted": "^3.1.0",[m
[32m+[m[32m        "rimraf": "^3.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^10.12.0 || >=12.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/flatted": {[m
[32m+[m[32m      "version": "3.2.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/flatted/-/flatted-3.2.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-5nqDSxl8nn5BSNxyR3n4I6eDmbolI6WT+QqR547RwxQapgjQBmtktdP+HTBb/a/zLsbzERTONyUB5pefh5TtjQ==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/fs.realpath": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-OO0pH2lK6a0hZnAdau5ItzHPI6pUlvI7jMVnxUQRtw4owF2wk8lOSabtGDCTP4Ggrg2MbGnWO9X8K1t4+fGMDw==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/function-bind": {[m
[32m+[m[32m      "version": "1.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/function-bind/-/function-bind-1.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-yIovAzMX49sF8Yl58fSCWJ5svSLuaibPxXQJFLmBObTuCr0Mf1KiPopGM9NiFjiYBCbfaa2Fh6breQ6ANVTI0A==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/function.prototype.name": {[m
[32m+[m[32m      "version": "1.1.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/function.prototype.name/-/function.prototype.name-1.1.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-uN7m/BzVKQnCUF/iW8jYea67v++2u7m5UgENbHRtdDVclOUP+FMPlCNdmk0h/ysGyo2tavMJEDqJAkJdRa1vMA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "define-properties": "^1.1.3",[m
[32m+[m[32m        "es-abstract": "^1.19.0",[m
[32m+[m[32m        "functions-have-names": "^1.2.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/functions-have-names": {[m
[32m+[m[32m      "version": "1.2.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/functions-have-names/-/functions-have-names-1.2.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-xckBUXyTIqT97tq2x2AMb+g163b5JFysYk0x4qxNFwbfQkmNZoiRHb6sPzI9/QV33WeuvVYBUIiD4NzNIyqaRQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/get-intrinsic": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-QJVz1Tj7MS099PevUG5jvnt9tSkXN8K14dxQlikJuPt4uD9hHAHjLyLBiLR5zELelBdD9QNRAXZzsJx0WaDL9A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "function-bind": "^1.1.1",[m
[32m+[m[32m        "has": "^1.0.3",[m
[32m+[m[32m        "has-symbols": "^1.0.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/get-symbol-description": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/get-symbol-description/-/get-symbol-description-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-2EmdH1YvIQiZpltCNgkuiUnyukzxM/R6NDJX31Ke3BG1Nq5b0S2PhX59UKi9vZpPDQVdqn+1IcaAwnzTT5vCjw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "get-intrinsic": "^1.1.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/glob": {[m
[32m+[m[32m      "version": "7.2.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/glob/-/glob-7.2.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-nFR0zLpU2YCaRxwoCJvL6UvCH2JFyFVIvwTLsIf21AuHlMskA1hhTdk+LlYJtOlYt9v6dvszD2BGRqBL+iQK9Q==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "fs.realpath": "^1.0.0",[m
[32m+[m[32m        "inflight": "^1.0.4",[m
[32m+[m[32m        "inherits": "2",[m
[32m+[m[32m        "minimatch": "^3.1.1",[m
[32m+[m[32m        "once": "^1.3.0",[m
[32m+[m[32m        "path-is-absolute": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "*"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/isaacs"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/glob-parent": {[m
[32m+[m[32m      "version": "6.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/glob-parent/-/glob-parent-6.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-XxwI8EOhVQgWp6iDL+3b0r86f4d6AX6zSU55HfB4ydCEuXLXc5FcYeOu+nnGftS4TEju/11rt4KJPTMgbfmv4A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "is-glob": "^4.0.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10.13.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/globals": {[m
[32m+[m[32m      "version": "13.17.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/globals/-/globals-13.17.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-1C+6nQRb1GwGMKm2dH/E7enFAMxGTmGI7/dEdhy/DNelv85w9B72t3uc5frtMNXIbzrarJJ/lTCjcaZwbLJmyw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "type-fest": "^0.20.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/sindresorhus"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/globby": {[m
[32m+[m[32m      "version": "11.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/globby/-/globby-11.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-jhIXaOzy1sb8IyocaruWSn1TjmnBVs8Ayhcy83rmxNJ8q2uWKCAj3CnJY+KpGSXCueAPc0i05kVvVKtP1t9S3g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "array-union": "^2.1.0",[m
[32m+[m[32m        "dir-glob": "^3.0.1",[m
[32m+[m[32m        "fast-glob": "^3.2.9",[m
[32m+[m[32m        "ignore": "^5.2.0",[m
[32m+[m[32m        "merge2": "^1.4.1",[m
[32m+[m[32m        "slash": "^3.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/sindresorhus"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/grapheme-splitter": {[m
[32m+[m[32m      "version": "1.0.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/grapheme-splitter/-/grapheme-splitter-1.0.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-bzh50DW9kTPM00T8y4o8vQg89Di9oLJVLW/KaOGIXJWP/iqCN6WKYkbNOF04vFLJhwcpYUh9ydh/+5vpOqV4YQ==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/has": {[m
[32m+[m[32m      "version": "1.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/has/-/has-1.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-f2dvO0VU6Oej7RkWJGrehjbzMAjFp5/VKPp5tTpWIV4JHHZK1/BxbFRtf/siA2SWTe09caDmVtYYzWEIbBS4zw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "function-bind": "^1.1.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/has-bigints": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/has-bigints/-/has-bigints-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-tSvCKtBr9lkF0Ex0aQiP9N+OpV4zi2r/Nee5VkRDbaqv35RLYMzbwQfFSZZH0kR+Rd6302UJZ2p/bJCEoR3VoQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/has-flag": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-EykJT/Q1KjTWctppgIAgfSO0tKVuZUjhgMr17kqTumMl6Afv3EISleU7qZUzoXDFTAHTDC4NOoG/ZxU3EvlMPQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/has-property-descriptors": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/has-property-descriptors/-/has-property-descriptors-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-62DVLZGoiEBDHQyqG4w9xCuZ7eJEwNmJRWw2VY84Oedb7WFcA27fiEVe8oUQx9hAUJ4ekurquucTGwsyO1XGdQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "get-intrinsic": "^1.1.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/has-symbols": {[m
[32m+[m[32m      "version": "1.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/has-symbols/-/has-symbols-1.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-l3LCuF6MgDNwTDKkdYGEihYjt5pRPbEg46rtlmnSPlUbgmB8LOIrKJbYYFBSbnPaJexMKtiPO8hmeRjRz2Td+A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/has-tostringtag": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/has-tostringtag/-/has-tostringtag-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-kFjcSNhnlGV1kyoGk7OXKSawH5JOb/LzUc5w9B02hOTO0dfFRjbHQKvg1d6cf3HbeUmtU9VbbV3qzZ2Teh97WQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "has-symbols": "^1.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/ignore": {[m
[32m+[m[32m      "version": "5.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ignore/-/ignore-5.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-CmxgYGiEPCLhfLnpPp1MoRmifwEIOgjcHXxOBjv7mY96c+eWScsOP9c112ZyLdWHi0FxHjI+4uVhKYp/gcdRmQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/import-fresh": {[m
[32m+[m[32m      "version": "3.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/import-fresh/-/import-fresh-3.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-veYYhQa+D1QBKznvhUHxb8faxlrwUnxseDAbAp457E0wLNio2bOSKnjYDhMj+YiAq61xrMGhQk9iXVk5FzgQMw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "parent-module": "^1.0.0",[m
[32m+[m[32m        "resolve-from": "^4.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/sindresorhus"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/imurmurhash": {[m
[32m+[m[32m      "version": "0.1.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/imurmurhash/-/imurmurhash-0.1.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-JmXMZ6wuvDmLiHEml9ykzqO6lwFbof0GG4IkcGaENdCRDDmMVnny7s5HsIgHCbaq0w2MyPhDqkhTUgS2LU2PHA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.8.19"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/inflight": {[m
[32m+[m[32m      "version": "1.0.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-k92I/b08q4wvFscXCLvqfsHCrjrF7yiXsQuIVvVE7N82W3+aqpzuUdBbfhWcy/FZR3/4IgflMgKLOsvPDrGCJA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "once": "^1.3.0",[m
[32m+[m[32m        "wrappy": "1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/inherits": {[m
[32m+[m[32m      "version": "2.0.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-k/vGaX4/Yla3WzyMCvTQOXYeIHvqOKtnqBduzTHpzpQZzAskKMhZ2K+EnBiSM9zGSoIFeMpXKxa4dYeZIQqewQ==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/internal-slot": {[m
[32m+[m[32m      "version": "1.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/internal-slot/-/internal-slot-1.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-O0DB1JC/sPyZl7cIo78n5dR7eUSwwpYPiXRhTzNxZVAMUuB8vlnRFyLxdrVToks6XPLVnFfbzaVd5WLjhgg+vA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "get-intrinsic": "^1.1.0",[m
[32m+[m[32m        "has": "^1.0.3",[m
[32m+[m[32m        "side-channel": "^1.0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/invariant": {[m
[32m+[m[32m      "version": "2.2.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/invariant/-/invariant-2.2.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-phJfQVBuaJM5raOpJjSfkiD6BpbCE4Ns//LaXl6wGYtUBY83nWS6Rf9tXm2e8VaK60JEjYldbPif/A2B1C2gNA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "loose-envify": "^1.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-bigint": {[m
[32m+[m[32m      "version": "1.0.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-bigint/-/is-bigint-1.0.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-zB9CruMamjym81i2JZ3UMn54PKGsQzsJeo6xvN3HJJ4CAsQNB6iRutp2To77OfCNuoxspsIhzaPoO1zyCEhFOg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "has-bigints": "^1.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-boolean-object": {[m
[32m+[m[32m      "version": "1.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-boolean-object/-/is-boolean-object-1.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-gDYaKHJmnj4aWxyj6YHyXVpdQawtVLHU5cb+eztPGczf6cjuTdwve5ZIEfgXqH4e57An1D1AKf8CZ3kYrQRqYA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "has-tostringtag": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-callable": {[m
[32m+[m[32m      "version": "1.2.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-callable/-/is-callable-1.2.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-1BC0BVFhS/p0qtw6enp8e+8OD0UrK0oFLztSjNzhcKA3WDuJxxAPXzPuPtKkjEY9UUoEWlX/8fgKeu2S8i9JTA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-core-module": {[m
[32m+[m[32m      "version": "2.11.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-core-module/-/is-core-module-2.11.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-RRjxlvLDkD1YJwDbroBHMb+cukurkDWNyHx7D3oNB5x9rb5ogcksMC5wHCadcXoo67gVr/+3GFySh3134zi6rw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "has": "^1.0.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-date-object": {[m
[32m+[m[32m      "version": "1.0.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-date-object/-/is-date-object-1.0.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-9YQaSxsAiSwcvS33MBk3wTCVnWK+HhF8VZR2jRxehM16QcVOdHqPn4VPHmRK4lSr38n9JriurInLcP90xsYNfQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "has-tostringtag": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-extglob": {[m
[32m+[m[32m      "version": "2.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-SbKbANkN603Vi4jEZv49LeVJMn4yGwsbzZworEoyEiutsN3nJYdbO36zfhGJ6QEDpOZIFkDtnq5JRxmvl3jsoQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-fullwidth-code-point": {[m
[32m+[m[32m      "version": "3.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-zymm5+u+sCsSWyD9qNaejV3DFvhCKclKdizYaJUuHA83RLjb7nSuGnddCHGv0hk+KY7BMAlsWeK4Ueg6EV6XQg==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-glob": {[m
[32m+[m[32m      "version": "4.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-glob/-/is-glob-4.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-xelSayHH36ZgE7ZWhli7pW34hNbNl8Ojv5KVmkJD4hBdD3th8Tfk9vYasLM+mXWOZhFkgZfxhLSnrwRr4elSSg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "is-extglob": "^2.1.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-negative-zero": {[m
[32m+[m[32m      "version": "2.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-negative-zero/-/is-negative-zero-2.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-dqJvarLawXsFbNDeJW7zAz8ItJ9cd28YufuuFzh0G8pNHjJMnY08Dv7sYX2uF5UpQOwieAeOExEYAWWfu7ZZUA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-number": {[m
[32m+[m[32m      "version": "7.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-41Cifkg6e8TylSpdtTpeLVMqvSBEVzTttHvERD741+pnZ8ANv0004MRL43QKPDlK9cGvNp6NZWZUBlbGXYxxng==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.12.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-number-object": {[m
[32m+[m[32m      "version": "1.0.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-number-object/-/is-number-object-1.0.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-k1U0IRzLMo7ZlYIfzRu23Oh6MiIFasgpb9X76eqfFZAqwH44UI4KTBvBYIZ1dSL9ZzChTB9ShHfLkR4pdW5krQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "has-tostringtag": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-path-inside": {[m
[32m+[m[32m      "version": "3.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-path-inside/-/is-path-inside-3.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-Fd4gABb+ycGAmKou8eMftCupSir5lRxqf4aD/vd0cD2qc4HL07OjCeuHMr8Ro4CoMaeCKDB0/ECBOVWjTwUvPQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-regex": {[m
[32m+[m[32m      "version": "1.1.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-regex/-/is-regex-1.1.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-kvRdxDsxZjhzUX07ZnLydzS1TU/TJlTUHHY4YLL87e37oUA49DfkLqgy+VjFocowy29cKvcSiu+kIv728jTTVg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "has-tostringtag": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-shared-array-buffer": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-shared-array-buffer/-/is-shared-array-buffer-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-sqN2UDu1/0y6uvXyStCOzyhAjCSlHceFoMKJW8W9EU9cvic/QdsZ0kEU93HEy3IUEFZIiH/3w+AH/UQbPHNdhA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-string": {[m
[32m+[m[32m      "version": "1.0.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-string/-/is-string-1.0.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-tE2UXzivje6ofPW7l23cjDOMa09gb7xlAqG6jG5ej6uPV32TlWP3NKPigtaGeHNu9fohccRYvIiZMfOOnOYUtg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "has-tostringtag": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-symbol": {[m
[32m+[m[32m      "version": "1.0.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-symbol/-/is-symbol-1.0.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-C/CPBqKWnvdcxqIARxyOh4v1UUEOCHpgDa0WYgpKDFMszcrPcffg5uhwSgPCLD2WWxmq6isisz87tzT01tuGhg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "has-symbols": "^1.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-weakref": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-weakref/-/is-weakref-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-qctsuLZmIQ0+vSSMfoVvyFe2+GSEvnmZ2ezTup1SBse9+twCCeial6EEi3Nc2KFcf6+qz2FBPnjXsk8xhKSaPQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/isexe": {[m
[32m+[m[32m      "version": "2.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-RHxMLp9lnKHGHRng9QFhRCMbYAcVpn69smSGcq3f36xjgVVWThj4qqLbTLlq7Ssj8B+fIQ1EuCEGI2lKsyQeIw==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/js-sdsl": {[m
[32m+[m[32m      "version": "4.1.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/js-sdsl/-/js-sdsl-4.1.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-08bOAKweV2NUC1wqTtf3qZlnpOX/R2DU9ikpjOHs0H+ibQv3zpncVQg6um4uYtRtrwIX8M4Nh3ytK4HGlYAq7Q==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/js-tokens": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-RdJUflcE3cUzKiMqQgsCu06FPu9UdIJO0beYbPhHN4k6apgJtifcoCtT9bcxOpYBtpD2kCM6Sbzg4CausW/PKQ=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/js-yaml": {[m
[32m+[m[32m      "version": "4.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/js-yaml/-/js-yaml-4.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-wpxZs9NoxZaJESJGIZTyDEaYpl0FKSA+FB9aJiyemKhMwkxQg63h4T1KJgUGHpTqPDNRcmmYLugrRjJlBtWvRA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "argparse": "^2.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "js-yaml": "bin/js-yaml.js"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/json-schema-traverse": {[m
[32m+[m[32m      "version": "0.4.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-xbbCH5dCYU5T8LcEhhuh7HJ88HXuW3qsI3Y0zOZFKfZEHcpWiHU/Jxzk629Brsab/mMiHQti9wMP+845RPe3Vg==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/json-stable-stringify-without-jsonify": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-Bdboy+l7tA3OGW6FjyFHWkP5LuByj1Tk33Ljyq0axyzdk9//JSi2u3fP1QSmd1KNwq6VOKYGlAu87CisVir6Pw==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/json5": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/json5/-/json5-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-aKS4WQjPenRxiQsC93MNfjx+nbF4PAdYzmd/1JIj8HYzqfbu86beTuNgXDzPknWk0n0uARlyewZo4s++ES36Ow==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "minimist": "^1.2.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "json5": "lib/cli.js"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/jsx-ast-utils": {[m
[32m+[m[32m      "version": "3.3.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/jsx-ast-utils/-/jsx-ast-utils-3.3.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-fYQHZTZ8jSfmWZ0iyzfwiU4WDX4HpHbMCZ3gPlWYiCl3BoeOTsqKBqnTVfH2rYT7eP5c3sVbeSPHnnJOaTrWiw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "array-includes": "^3.1.5",[m
[32m+[m[32m        "object.assign": "^4.1.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/language-subtag-registry": {[m
[32m+[m[32m      "version": "0.3.22",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/language-subtag-registry/-/language-subtag-registry-0.3.22.tgz",[m
[32m+[m[32m      "integrity": "sha512-tN0MCzyWnoz/4nHS6uxdlFWoUZT7ABptwKPQ52Ea7URk6vll88bWBVhodtnlfEuCcKWNGoc+uGbw1cwa9IKh/w==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/language-tags": {[m
[32m+[m[32m      "version": "1.0.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/language-tags/-/language-tags-1.0.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-qJhlO9cGXi6hBGKoxEG/sKZDAHD5Hnu9Hs4WbOY3pCWXDhw0N8x1NenNzm2EnNLkLkk7J2SdxAkDSbb6ftT+UQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "language-subtag-registry": "~0.3.2"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/levn": {[m
[32m+[m[32m      "version": "0.4.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/levn/-/levn-0.4.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-+bT2uH4E5LGE7h/n3evcS/sQlJXCpIp6ym8OWJ5eV6+67Dsql/LaaT7qJBAt2rzfoa/5QBGBhxDix1dMt2kQKQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "prelude-ls": "^1.2.1",[m
[32m+[m[32m        "type-check": "~0.4.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/locate-path": {[m
[32m+[m[32m      "version": "6.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/locate-path/-/locate-path-6.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-iPZK6eYjbxRu3uB4/WZ3EsEIMJFMqAoopl3R+zuq0UjcAm/MO6KCweDgPfP3elTztoKP3KtnVHxTn2NHBSDVUw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "p-locate": "^5.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/sindresorhus"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/lodash.merge": {[m
[32m+[m[32m      "version": "4.6.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lodash.merge/-/lodash.merge-4.6.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-0KpjqXRVvrYyCsX1swR/XTK0va6VQkQM6MNo7PqW77ByjAhoARA8EfrP1N4+KlKj8YS0ZUCtRT/YUuhyYDujIQ==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/lodash.truncate": {[m
[32m+[m[32m      "version": "4.4.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lodash.truncate/-/lodash.truncate-4.4.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-jttmRe7bRse52OsWIMDLaXxWqRAmtIUccAQ3garviCqJjafXOfNMO0yMfNpdD6zbGaTU0P5Nz7e7gAT6cKmJRw=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/loose-envify": {[m
[32m+[m[32m      "version": "1.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/loose-envify/-/loose-envify-1.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-lyuxPGr/Wfhrlem2CL/UcnUc1zcqKAImBDzukY7Y5F/yQiNdko6+fRLevlw1HgMySw7f611UIY408EtxRSoK3Q==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "js-tokens": "^3.0.0 || ^4.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "loose-envify": "cli.js"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/lru-cache": {[m
[32m+[m[32m      "version": "6.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lru-cache/-/lru-cache-6.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Jo6dJ04CmSjuznwJSS3pUeWmd/H0ffTlkXXgwZi+eq1UCmqQwCh+eLsYOYCwY991i2Fah4h1BEMCx4qThGbsiA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "yallist": "^4.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/merge2": {[m
[32m+[m[32m      "version": "1.4.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/merge2/-/merge2-1.4.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-8q7VEgMJW4J8tcfVPy8g09NcQwZdbwFEqhe/WZkoIzjn/3TGDwtOCYtXGxA3O8tPzpczCCDgv+P2P5y00ZJOOg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/micromatch": {[m
[32m+[m[32m      "version": "4.0.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/micromatch/-/micromatch-4.0.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-DMy+ERcEW2q8Z2Po+WNXuw3c5YaUSFjAO5GsJqfEl7UjvtIuFKO6ZrKvcItdy98dwFI2N1tg3zNIdKaQT+aNdA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "braces": "^3.0.2",[m
[32m+[m[32m        "picomatch": "^2.3.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/minimatch": {[m
[32m+[m[32m      "version": "3.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/minimatch/-/minimatch-3.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-J7p63hRiAjw1NDEww1W7i37+ByIrOWO5XQQAzZ3VOcL0PNybwpfmV/N05zFAzwQ9USyEcX6t3UO+K5aqBQOIHw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "brace-expansion": "^1.1.7"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "*"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/minimist": {[m
[32m+[m[32m      "version": "1.2.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/minimist/-/minimist-1.2.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-bzfL1YUZsP41gmu/qjrEk0Q6i2ix/cVeAhbCbqH9u3zYutS1cLg00qhrD0M2MVdCcx4Sc0UpP2eBWo9rotpq6g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/ms": {[m
[32m+[m[32m      "version": "2.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ms/-/ms-2.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-sGkPx+VjMtmA6MX27oA4FBFELFCZZ4S4XqeGOXCv68tT+jb3vk/RyaKWP0PTKyWtmLSM0b+adUTEvbs1PEaH2w==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/nanoid": {[m
[32m+[m[32m      "version": "3.3.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/nanoid/-/nanoid-3.3.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-MqBkQh/OHTS2egovRtLk45wEyNXwF+cokD+1YPf9u5VfJiRdAiRwB2froX5Co9Rh20xs4siNPm8naNotSD6RBw==",[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "nanoid": "bin/nanoid.cjs"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^10 || ^12 || ^13.7 || ^14 || >=15.0.1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/natural-compare": {[m
[32m+[m[32m      "version": "1.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/natural-compare/-/natural-compare-1.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-OWND8ei3VtNC9h7V60qff3SVobHr996CTwgxubgyQYEpg290h9J0buyECNNJexkFm5sOajh5G116RYA1c8ZMSw==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/next": {[m
[32m+[m[32m      "version": "13.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/next/-/next-13.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-puH1WGM6rGeFOoFdXXYfUxN9Sgi4LMytCV5HkQJvVUOhHfC1DoVqOfvzaEteyp6P04IW+gbtK2Q9pInVSrltPA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@next/env": "13.0.0",[m
[32m+[m[32m        "@swc/helpers": "0.4.11",[m
[32m+[m[32m        "caniuse-lite": "^1.0.30001406",[m
[32m+[m[32m        "postcss": "8.4.14",[m
[32m+[m[32m        "styled-jsx": "5.1.0",[m
[32m+[m[32m        "use-sync-external-store": "1.2.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "next": "dist/bin/next"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=14.6.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "optionalDependencies": {[m
[32m+[m[32m        "@next/swc-android-arm-eabi": "13.0.0",[m
[32m+[m[32m        "@next/swc-android-arm64": "13.0.0",[m
[32m+[m[32m        "@next/swc-darwin-arm64": "13.0.0",[m
[32m+[m[32m        "@next/swc-darwin-x64": "13.0.0",[m
[32m+[m[32m        "@next/swc-freebsd-x64": "13.0.0",[m
[32m+[m[32m        "@next/swc-linux-arm-gnueabihf": "13.0.0",[m
[32m+[m[32m        "@next/swc-linux-arm64-gnu": "13.0.0",[m
[32m+[m[32m        "@next/swc-linux-arm64-musl": "13.0.0",[m
[32m+[m[32m        "@next/swc-linux-x64-gnu": "13.0.0",[m
[32m+[m[32m        "@next/swc-linux-x64-musl": "13.0.0",[m
[32m+[m[32m        "@next/swc-win32-arm64-msvc": "13.0.0",[m
[32m+[m[32m        "@next/swc-win32-ia32-msvc": "13.0.0",[m
[32m+[m[32m        "@next/swc-win32-x64-msvc": "13.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "fibers": ">= 3.1.0",[m
[32m+[m[32m        "node-sass": "^6.0.0 || ^7.0.0",[m
[32m+[m[32m        "react": "^18.0.0-0",[m
[32m+[m[32m        "react-dom": "^18.0.0-0",[m
[32m+[m[32m        "sass": "^1.3.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "fibers": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        },[m
[32m+[m[32m        "node-sass": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        },[m
[32m+[m[32m        "sass": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/object-assign": {[m
[32m+[m[32m      "version": "4.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-rJgTQnkUnH1sFw8yT6VSU3zD3sWmu6sZhIseY8VX+GRu3P6F7Fu+JNDoXfklElbLJSnc3FUQHVe4cU5hj+BcUg==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/object-inspect": {[m
[32m+[m[32m      "version": "1.12.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/object-inspect/-/object-inspect-1.12.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-z+cPxW0QGUp0mcqcsgQyLVRDoXFQbXOwBaqyF7VIgI4TWNQsDHrBpUQslRmIfAoYWdYzs6UlKJtB2XJpTaNSpQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/object-keys": {[m
[32m+[m[32m      "version": "1.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/object-keys/-/object-keys-1.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-NuAESUOUMrlIXOfHKzD6bpPu3tYt3xvjNdRIQ+FeT0lNb4K8WR70CaDxhuNguS2XG+GjkyMwOzsN5ZktImfhLA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/object.assign": {[m
[32m+[m[32m      "version": "4.1.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/object.assign/-/object.assign-4.1.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-1mxKf0e58bvyjSCtKYY4sRe9itRk3PJpquJOjeIkz885CczcI4IvJJDLPS72oowuSh+pBxUFROpX+TU++hxhZQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "define-properties": "^1.1.4",[m
[32m+[m[32m        "has-symbols": "^1.0.3",[m
[32m+[m[32m        "object-keys": "^1.1.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/object.entries": {[m
[32m+[m[32m      "version": "1.1.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/object.entries/-/object.entries-1.1.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-TyxmjUoZggd4OrrU1W66FMDG6CuqJxsFvymeyXI51+vQLN67zYfZseptRge703kKQdo4uccgAKebXFcRCzk4+g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "define-properties": "^1.1.3",[m
[32m+[m[32m        "es-abstract": "^1.19.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/object.fromentries": {[m
[32m+[m[32m      "version": "2.0.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/object.fromentries/-/object.fromentries-2.0.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-CAyG5mWQRRiBU57Re4FKoTBjXfDoNwdFVH2Y1tS9PqCsfUTymAohOkEMSG3aRNKmv4lV3O7p1et7c187q6bynw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "define-properties": "^1.1.3",[m
[32m+[m[32m        "es-abstract": "^1.19.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/object.hasown": {[m
[32m+[m[32m      "version": "1.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/object.hasown/-/object.hasown-1.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-LYLe4tivNQzq4JdaWW6WO3HMZZJWzkkH8fnI6EebWl0VZth2wL2Lovm74ep2/gZzlaTdV62JZHEqHQ2yVn8Q/A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "define-properties": "^1.1.4",[m
[32m+[m[32m        "es-abstract": "^1.19.5"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/object.values": {[m
[32m+[m[32m      "version": "1.1.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/object.values/-/object.values-1.1.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-QUZRW0ilQ3PnPpbNtgdNV1PDbEqLIiSFB3l+EnGtBQ/8SUTLj1PZwtQHABZtLgwpJZTSZhuGLOGk57Drx2IvYg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "define-properties": "^1.1.3",[m
[32m+[m[32m        "es-abstract": "^1.19.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/once": {[m
[32m+[m[32m      "version": "1.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/once/-/once-1.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-lNaJgI+2Q5URQBkccEKHTQOPaXdUxnZZElQTZY0MFUAuaEqe1E+Nyvgdz/aIyNi6Z9MzO5dv1H8n58/GELp3+w==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "wrappy": "1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/optionator": {[m
[32m+[m[32m      "version": "0.9.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/optionator/-/optionator-0.9.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-74RlY5FCnhq4jRxVUPKDaRwrVNXMqsGsiW6AJw4XK8hmtm10wC0ypZBLw5IIp85NZMr91+qd1RvvENwg7jjRFw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "deep-is": "^0.1.3",[m
[32m+[m[32m        "fast-levenshtein": "^2.0.6",[m
[32m+[m[32m        "levn": "^0.4.1",[m
[32m+[m[32m        "prelude-ls": "^1.2.1",[m
[32m+[m[32m        "type-check": "^0.4.0",[m
[32m+[m[32m        "word-wrap": "^1.2.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/p-limit": {[m
[32m+[m[32m      "version": "3.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/p-limit/-/p-limit-3.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-TYOanM3wGwNGsZN2cVTYPArw454xnXj5qmWF1bEoAc4+cU/ol7GVh7odevjp1FNHduHc3KZMcFduxU5Xc6uJRQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "yocto-queue": "^0.1.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/sindresorhus"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/p-locate": {[m
[32m+[m[32m      "version": "5.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/p-locate/-/p-locate-5.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-LaNjtRWUBY++zB5nE/NwcaoMylSPk+S+ZHNB1TzdbMJMny6dynpAGt7X/tl/QYq3TIeE6nxHppbo2LGymrG5Pw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "p-limit": "^3.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/sindresorhus"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/parent-module": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/parent-module/-/parent-module-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-GQ2EWRpQV8/o+Aw8YqtfZZPfNRWZYkbidE9k5rpl/hC3vtHHBfGm2Ifi6qWV+coDGkrUKZAxE3Lot5kcsRlh+g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "callsites": "^3.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/path-exists": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/path-exists/-/path-exists-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-ak9Qy5Q7jYb2Wwcey5Fpvg2KoAc/ZIhLSLOSBmRmygPsGwkVVt0fZa0qrtMz+m6tJTAHfZQ8FnmB4MG4LWy7/w==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/path-is-absolute": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-AVbw3UJ2e9bq64vSaS9Am0fje1Pa8pbGqTTsmXfaIiMpnr5DlDhfJOuLj9Sf95ZPVDAUerDfEk88MPmPe7UCQg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/path-key": {[m
[32m+[m[32m      "version": "3.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-ojmeN0qd+y0jszEtoY48r0Peq5dwMEkIlCOu6Q5f41lfkswXuKtYrhgoTpLnyIcHm24Uhqx+5Tqm2InSwLhE6Q==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/path-parse": {[m
[32m+[m[32m      "version": "1.0.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/path-parse/-/path-parse-1.0.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-LDJzPVEEEPR+y48z93A0Ed0yXb8pAByGWo/k5YYdYgpY2/2EsOsksJrq7lOHxryrVOn1ejG6oAp8ahvOIQD8sw==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/path-type": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/path-type/-/path-type-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-gDKb8aZMDeD/tZWs9P6+q0J9Mwkdl6xMV8TjnGP3qJVJ06bdMgkbBlLU8IdfOsIsFz2BW1rNVT3XuNEl8zPAvw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/picocolors": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/picocolors/-/picocolors-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-1fygroTLlHu66zi26VoTDv8yRgm0Fccecssto+MhsZ0D/DGW2sm8E8AjW7NU5VVTRt5GxbeZ5qBuJr+HyLYkjQ=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/picomatch": {[m
[32m+[m[32m      "version": "2.3.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/picomatch/-/picomatch-2.3.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-JU3teHTNjmE2VCGFzuY8EXzCDVwEqB2a8fsIvwaStHhAWJEeVd1o1QD80CU6+ZdEXXSLbSsuLwJjkCBWqRQUVA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8.6"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/jonschlinkert"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/postcss": {[m
[32m+[m[32m      "version": "8.4.14",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/postcss/-/postcss-8.4.14.tgz",[m
[32m+[m[32m      "integrity": "sha512-E398TUmfAYFPBSdzgeieK2Y1+1cpdxJx8yXbK/m57nRhKSmk1GB2tO4lbLBtlkfPQTDKfe4Xqv1ASWPpayPEig==",[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "opencollective",[m
[32m+[m[32m          "url": "https://opencollective.com/postcss/"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "tidelift",[m
[32m+[m[32m          "url": "https://tidelift.com/funding/github/npm/postcss"[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "nanoid": "^3.3.4",[m
[32m+[m[32m        "picocolors": "^1.0.0",[m
[32m+[m[32m        "source-map-js": "^1.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^10 || ^12 || >=14"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/prelude-ls": {[m
[32m+[m[32m      "version": "1.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/prelude-ls/-/prelude-ls-1.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-vkcDPrRZo1QZLbn5RLGPpg/WmIQ65qoWWhcGKf/b5eplkkarX0m9z8ppCat4mlOqUsWpyNuYgO3VRyrYHSzX5g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/prop-types": {[m
[32m+[m[32m      "version": "15.8.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/prop-types/-/prop-types-15.8.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-oj87CgZICdulUohogVAR7AjlC0327U4el4L6eAvOqCeudMDVU0NThNaV+b9Df4dXgSP1gXMTnPdhfe/2qDH5cg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "loose-envify": "^1.4.0",[m
[32m+[m[32m        "object-assign": "^4.1.1",[m
[32m+[m[32m        "react-is": "^16.13.1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/prop-types-extra": {[m
[32m+[m[32m      "version": "1.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/prop-types-extra/-/prop-types-extra-1.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-59+AHNnHYCdiC+vMwY52WmvP5dM3QLeoumYuEyceQDi9aEhtwN9zIQ2ZNo25sMyXnbh32h+P1ezDsUpUH3JAew==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "react-is": "^16.3.2",[m
[32m+[m[32m        "warning": "^4.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": ">=0.14.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/punycode": {[m
[32m+[m[32m      "version": "2.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-XRsRjdf+j5ml+y/6GKHPZbrF/8p2Yga0JPtdqTIY2Xe5ohJPD9saDJJLPvp9+NSBprVvevdXZybnj2cv8OEd0A==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/queue-microtask": {[m
[32m+[m[32m      "version": "1.2.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/queue-microtask/-/queue-microtask-1.2.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-NuaNSa6flKT5JaSYQzJok04JzTL1CA6aGhv5rfLW3PgqA+M2ChpZQnAC8h8i4ZFkBS8X5RqkDBHA7r4hej3K9A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "github",[m
[32m+[m[32m          "url": "https://github.com/sponsors/feross"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "patreon",[m
[32m+[m[32m          "url": "https://www.patreon.com/feross"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "consulting",[m
[32m+[m[32m          "url": "https://feross.org/support"[m
[32m+[m[32m        }[m
[32m+[m[32m      ][m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/react": {[m
[32m+[m[32m      "version": "18.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/react/-/react-18.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-/3IjMdb2L9QbBdWiW5e3P2/npwMBaU9mHCSCUzNln0ZCYbcfTsGbTJrU/kGemdH2IWmB2ioZ+zkxtmq6g09fGQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "loose-envify": "^1.1.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/react-bootstrap": {[m
[32m+[m[32m      "version": "2.6.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/react-bootstrap/-/react-bootstrap-2.6.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-WnDgN6PR8WZKo2Og5J8EafFi4BsABjc96lNuMNfksrgiPDCw18/woWQCNhAeHFZQWTQ/PijkOrQ9ncTWwO//AA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.17.2",[m
[32m+[m[32m        "@restart/hooks": "^0.4.6",[m
[32m+[m[32m        "@restart/ui": "^1.4.1",[m
[32m+[m[32m        "@types/react-transition-group": "^4.4.4",[m
[32m+[m[32m        "classnames": "^2.3.1",[m
[32m+[m[32m        "dom-helpers": "^5.2.1",[m
[32m+[m[32m        "invariant": "^2.2.4",[m
[32m+[m[32m        "prop-types": "^15.8.1",[m
[32m+[m[32m        "prop-types-extra": "^1.1.0",[m
[32m+[m[32m        "react-transition-group": "^4.4.2",[m
[32m+[m[32m        "uncontrollable": "^7.2.1",[m
[32m+[m[32m        "warning": "^4.0.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@types/react": ">=16.14.8",[m
[32m+[m[32m        "react": ">=16.14.0",[m
[32m+[m[32m        "react-dom": ">=16.14.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "@types/react": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/react-dom": {[m
[32m+[m[32m      "version": "18.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/react-dom/-/react-dom-18.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-6IMTriUmvsjHUjNtEDudZfuDQUoWXVxKHhlEGSk81n4YFS+r/Kl99wXiwlVXtPBtJenozv2P+hxDsw9eA7Xo6g==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "loose-envify": "^1.1.0",[m
[32m+[m[32m        "scheduler": "^0.23.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": "^18.2.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/react-is": {[m
[32m+[m[32m      "version": "16.13.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/react-is/-/react-is-16.13.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-24e6ynE2H+OKt4kqsOvNd8kBpV65zoxbA4BVsEOB3ARVWQki/DHzaUoC5KuON/BiccDaCCTZBuOcfZs70kR8bQ=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/react-lifecycles-compat": {[m
[32m+[m[32m      "version": "3.0.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/react-lifecycles-compat/-/react-lifecycles-compat-3.0.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-fBASbA6LnOU9dOU2eW7aQ8xmYBSXUIWr+UmF9b1efZBazGNO+rcXT/icdKnYm2pTwcRylVUYwW7H1PHfLekVzA=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/react-transition-group": {[m
[32m+[m[32m      "version": "4.4.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/react-transition-group/-/react-transition-group-4.4.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-pZcd1MCJoiKiBR2NRxeCRg13uCXbydPnmB4EOeRrY7480qNWO8IIgQG6zlDkm6uRMsURXPuKq0GWtiM59a5Q6g==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.5.5",[m
[32m+[m[32m        "dom-helpers": "^5.0.1",[m
[32m+[m[32m        "loose-envify": "^1.4.0",[m
[32m+[m[32m        "prop-types": "^15.6.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": ">=16.6.0",[m
[32m+[m[32m        "react-dom": ">=16.6.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/regenerator-runtime": {[m
[32m+[m[32m      "version": "0.13.10",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/regenerator-runtime/-/regenerator-runtime-0.13.10.tgz",[m
[32m+[m[32m      "integrity": "sha512-KepLsg4dU12hryUO7bp/axHAKvwGOCV0sGloQtpagJ12ai+ojVDqkeGSiRX1zlq+kjIMZ1t7gpze+26QqtdGqw=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/regexp.prototype.flags": {[m
[32m+[m[32m      "version": "1.4.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/regexp.prototype.flags/-/regexp.prototype.flags-1.4.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-fjggEOO3slI6Wvgjwflkc4NFRCTZAu5CnNfBd5qOMYhWdn67nJBBu34/TkD++eeFmd8C9r9jfXJ27+nSiRkSUA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "define-properties": "^1.1.3",[m
[32m+[m[32m        "functions-have-names": "^1.2.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/regexpp": {[m
[32m+[m[32m      "version": "3.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/regexpp/-/regexpp-3.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-pq2bWo9mVD43nbts2wGv17XLiNLya+GklZ8kaDLV2Z08gDCsGpnKn9BFMepvWuHCbyVvY7J5o5+BVvoQbmlJLg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/mysticatea"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/require-from-string": {[m
[32m+[m[32m      "version": "2.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/require-from-string/-/require-from-string-2.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-Xf0nWe6RseziFMu+Ap9biiUbmplq6S9/p+7w7YXP/JBHhrUDDUhwa+vANyubuqfZWTveU//DYVGsDG7RKL/vEw==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/resolve": {[m
[32m+[m[32m      "version": "1.22.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/resolve/-/resolve-1.22.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-nBpuuYuY5jFsli/JIs1oldw6fOQCBioohqWZg/2hiaOybXOft4lonv85uDOKXdf8rhyK159cxU5cDcK/NKk8zw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "is-core-module": "^2.9.0",[m
[32m+[m[32m        "path-parse": "^1.0.7",[m
[32m+[m[32m        "supports-preserve-symlinks-flag": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "resolve": "bin/resolve"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/resolve-from": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/resolve-from/-/resolve-from-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-pb/MYmXstAkysRFx8piNI1tGFNQIFA3vkE3Gq4EuA1dF6gHp/+vgZqsCGJapvy8N3Q+4o7FwvquPJcnZ7RYy4g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/reusify": {[m
[32m+[m[32m      "version": "1.0.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/reusify/-/reusify-1.0.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-U9nH88a3fc/ekCF1l0/UP1IosiuIjyTh7hBvXVMHYgVcfGvt897Xguj2UOLDeI5BG2m7/uwyaLVT6fbtCwTyzw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "iojs": ">=1.0.0",[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/rimraf": {[m
[32m+[m[32m      "version": "3.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/rimraf/-/rimraf-3.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-JZkJMZkAGFFPP2YqXZXPbMlMBgsxzE8ILs4lMIX/2o0L9UBw9O/Y3o6wFw/i9YLapcUJWwqbi3kdxIPdC62TIA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "glob": "^7.1.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "rimraf": "bin.js"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/isaacs"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/run-parallel": {[m
[32m+[m[32m      "version": "1.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/run-parallel/-/run-parallel-1.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-5l4VyZR86LZ/lDxZTR6jqL8AFE2S0IFLMP26AbjsLVADxHdhB/c0GUsH+y39UfCi3dzz8OlQuPmnaJOMoDHQBA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "github",[m
[32m+[m[32m          "url": "https://github.com/sponsors/feross"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "patreon",[m
[32m+[m[32m          "url": "https://www.patreon.com/feross"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "consulting",[m
[32m+[m[32m          "url": "https://feross.org/support"[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "queue-microtask": "^1.2.2"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/safe-regex-test": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/safe-regex-test/-/safe-regex-test-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-JBUUzyOgEwXQY1NuPtvcj/qcBDbDmEvWufhlnXZIm75DEHp+afM1r1ujJpJsV/gSM4t59tpDyPi1sd6ZaPFfsA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "get-intrinsic": "^1.1.3",[m
[32m+[m[32m        "is-regex": "^1.1.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/scheduler": {[m
[32m+[m[32m      "version": "0.23.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/scheduler/-/scheduler-0.23.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-CtuThmgHNg7zIZWAXi3AsyIzA3n4xx7aNyjwC2VJldO2LMVDhFK+63xGqq6CsJH4rTAt6/M+N4GhZiDYPx9eUw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "loose-envify": "^1.1.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/semver": {[m
[32m+[m[32m      "version": "7.3.8",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/semver/-/semver-7.3.8.tgz",[m
[32m+[m[32m      "integrity": "sha512-NB1ctGL5rlHrPJtFDVIVzTyQylMLu9N9VICA6HSFJo8MCGVTMW6gfpicwKmmK/dAjTOrqu5l63JJOpDSrAis3A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "lru-cache": "^6.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "semver": "bin/semver.js"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/shebang-command": {[m
[32m+[m[32m      "version": "2.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-kHxr2zZpYtdmrN1qDjrrX/Z1rR1kG8Dx+gkpK1G4eXmvXswmcE1hTWBWYUzlraYw1/yZp6YuDY77YtvbN0dmDA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "shebang-regex": "^3.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/shebang-regex": {[m
[32m+[m[32m      "version": "3.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-7++dFhtcx3353uBaq8DDR4NuxBetBzC7ZQOhmTQInHEd6bSrXdiEyzCvG07Z44UYdLShWUyXt5M/yhz8ekcb1A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/side-channel": {[m
[32m+[m[32m      "version": "1.0.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/side-channel/-/side-channel-1.0.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-q5XPytqFEIKHkGdiMIrY10mvLRvnQh42/+GoBlFW3b2LXLE2xxJpZFdm94we0BaoV3RwJyGqg5wS7epxTv0Zvw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.0",[m
[32m+[m[32m        "get-intrinsic": "^1.0.2",[m
[32m+[m[32m        "object-inspect": "^1.9.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/slash": {[m
[32m+[m[32m      "version": "3.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/slash/-/slash-3.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-g9Q1haeby36OSStwb4ntCGGGaKsaVSjQ68fBxoQcutl5fS1vuY18H3wSt3jFyFtrkx+Kz0V1G85A4MyAdDMi2Q==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/slice-ansi": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/slice-ansi/-/slice-ansi-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-qMCMfhY040cVHT43K9BFygqYbUPFZKHOg7K73mtTWJRb8pyP3fzf4Ixd5SzdEJQ6MRUg/WBnOLxghZtKKurENQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "ansi-styles": "^4.0.0",[m
[32m+[m[32m        "astral-regex": "^2.0.0",[m
[32m+[m[32m        "is-fullwidth-code-point": "^3.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/chalk/slice-ansi?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/source-map-js": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/source-map-js/-/source-map-js-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-R0XvVJ9WusLiqTCEiGCmICCMplcCkIwwR11mOSD9CR5u+IXYdiseeEuXCVAjS54zqwkLcPNnmU4OeJ6tUrWhDw==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/string-width": {[m
[32m+[m[32m      "version": "4.2.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRNihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "emoji-regex": "^8.0.0",[m
[32m+[m[32m        "is-fullwidth-code-point": "^3.0.0",[m
[32m+[m[32m        "strip-ansi": "^6.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/string-width/node_modules/emoji-regex": {[m
[32m+[m[32m      "version": "8.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-MSjYzcWNOA0ewAHpz0MxpYFvwg6yjy1NG3xteoqz644VCo/RPgnr1/GGt+ic3iJTzQ8Eu3TdM14SawnVUmGE6A=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/string.prototype.matchall": {[m
[32m+[m[32m      "version": "4.0.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/string.prototype.matchall/-/string.prototype.matchall-4.0.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-f48okCX7JiwVi1NXCVWcFnZgADDC/n2vePlQ/KUCNqCikLLilQvwjMO8+BHVKvgzH0JB0J9LEPgxOGT02RoETg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "define-properties": "^1.1.3",[m
[32m+[m[32m        "es-abstract": "^1.19.1",[m
[32m+[m[32m        "get-intrinsic": "^1.1.1",[m
[32m+[m[32m        "has-symbols": "^1.0.3",[m
[32m+[m[32m        "internal-slot": "^1.0.3",[m
[32m+[m[32m        "regexp.prototype.flags": "^1.4.1",[m
[32m+[m[32m        "side-channel": "^1.0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/string.prototype.trimend": {[m
[32m+[m[32m      "version": "1.0.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/string.prototype.trimend/-/string.prototype.trimend-1.0.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-I7RGvmjV4pJ7O3kdf+LXFpVfdNOxtCW/2C8f6jNiW4+PQchwxkCDzlk1/7p+Wl4bqFIZeF47qAHXLuHHWKAxog==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "define-properties": "^1.1.4",[m
[32m+[m[32m        "es-abstract": "^1.19.5"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/string.prototype.trimstart": {[m
[32m+[m[32m      "version": "1.0.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/string.prototype.trimstart/-/string.prototype.trimstart-1.0.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-THx16TJCGlsN0o6dl2o6ncWUsdgnLRSA23rRE5pyGBw/mLr3Ej/R2LaqCtgP8VNMGZsvMWnf9ooZPyY2bHvUFg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "define-properties": "^1.1.4",[m
[32m+[m[32m        "es-abstract": "^1.19.5"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/strip-ansi": {[m
[32m+[m[32m      "version": "6.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-Y38VPSHcqkFrCpFnQ9vuSXmquuv5oXOKpGeT6aGrr3o3Gc9AlVa6JBfUSOCnbxGGZF+/0ooI7KrPuUSztUdU5A==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "ansi-regex": "^5.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/strip-bom": {[m
[32m+[m[32m      "version": "3.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/strip-bom/-/strip-bom-3.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-vavAMRXOgBVNF6nyEEmL3DBK19iRpDcoIwW+swQ+CbGiu7lju6t+JklA1MHweoWtadgt4ISVUsXLyDq34ddcwA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/strip-json-comments": {[m
[32m+[m[32m      "version": "3.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/strip-json-comments/-/strip-json-comments-3.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-6fPc+R4ihwqP6N/aIv2f1gMH8lOVtWQHoqC4yK6oSDVVocumAsfCqjkXnqiYMhmMwS/mEHLp7Vehlt3ql6lEig==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/sindresorhus"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/styled-jsx": {[m
[32m+[m[32m      "version": "5.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/styled-jsx/-/styled-jsx-5.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-/iHaRJt9U7T+5tp6TRelLnqBqiaIT0HsO0+vgyj8hK2KUk7aejFqRrumqPUlAqDwAj8IbS/1hk3IhBAAK/FCUQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "client-only": "0.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 12.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": ">= 16.8.0 || 17.x.x || ^18.0.0-0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "@babel/core": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        },[m
[32m+[m[32m        "babel-plugin-macros": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/supports-color": {[m
[32m+[m[32m      "version": "7.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-qpCAvRl9stuOHveKsn7HncJRvv501qIacKzQlO/+Lwxc9+0q2wLyv4Dfvt80/DPn2pqOBsJdDiogXGR9+OvwRw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "has-flag": "^4.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/supports-preserve-symlinks-flag": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-ot0WnXS9fgdkgIcePe6RHNk1WA8+muPa6cSjeR3V8K27q9BB1rTE3R1p7Hv0z1ZyAc8s6Vvv8DIyWf681MAt0w==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/table": {[m
[32m+[m[32m      "version": "6.8.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/table/-/table-6.8.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-Y4X9zqrCftUhMeH2EptSSERdVKt/nEdijTOacGD/97EKjhQ/Qs8RTlEGABSJNNN8lac9kheH+af7yAkEWlgneA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "ajv": "^8.0.1",[m
[32m+[m[32m        "lodash.truncate": "^4.4.2",[m
[32m+[m[32m        "slice-ansi": "^4.0.0",[m
[32m+[m[32m        "string-width": "^4.2.3",[m
[32m+[m[32m        "strip-ansi": "^6.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/table/node_modules/ajv": {[m
[32m+[m[32m      "version": "8.11.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ajv/-/ajv-8.11.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-E4bfmKAhGiSTvMfL1Myyycaub+cUEU2/IvpylXkUu7CHBkBj1f/ikdzbD7YQ6FKUbixDxeYvB/xY4fvyroDlQg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "fast-deep-equal": "^3.1.1",[m
[32m+[m[32m        "json-schema-traverse": "^1.0.0",[m
[32m+[m[32m        "require-from-string": "^2.0.2",[m
[32m+[m[32m        "uri-js": "^4.2.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/epoberezkin"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/table/node_modules/json-schema-traverse": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-NM8/P9n3XjXhIZn1lLhkFaACTOURQXjWhV4BA/RnOv8xvgqtqpAX9IO4mRQxSx1Rlo4tqzeqb0sOlruaOy3dug=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/text-table": {[m
[32m+[m[32m      "version": "0.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/text-table/-/text-table-0.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-N+8UisAXDGk8PFXP4HAzVR9nbfmVJ3zYLAWiTIoqC5v5isinhr+r5uaO8+7r3BMfuNIufIsA7RdpVgacC2cSpw==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/to-regex-range": {[m
[32m+[m[32m      "version": "5.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-65P7iz6X5yEr1cwcgvQxbbIw7Uk3gOy5dIdtZ4rDveLqhrdJP+Li/Hx6tyK0NEb+2GCyneCMJiGqrADCSNk8sQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "is-number": "^7.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/tsconfig-paths": {[m
[32m+[m[32m      "version": "3.14.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/tsconfig-paths/-/tsconfig-paths-3.14.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-fxDhWnFSLt3VuTwtvJt5fpwxBHg5AdKWMsgcPOOIilyjymcYVZoCQF8fvFRezCNfblEXmi+PcM1eYHeOAgXCOQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/json5": "^0.0.29",[m
[32m+[m[32m        "json5": "^1.0.1",[m
[32m+[m[32m        "minimist": "^1.2.6",[m
[32m+[m[32m        "strip-bom": "^3.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/tslib": {[m
[32m+[m[32m      "version": "2.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/tslib/-/tslib-2.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-d6xOpEDfsi2CZVlPQzGeux8XMwLT9hssAsaPYExaQMuYskwb+x1x7J371tWlbBdWHroy99KnVB6qIkUbs5X3UQ=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/tsutils": {[m
[32m+[m[32m      "version": "3.21.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/tsutils/-/tsutils-3.21.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-mHKK3iUXL+3UF6xL5k0PEhKRUBKPBCv/+RkEOpjRWxxx27KKRBmmA60A9pgOUvMi8GKhRMPEmjBRPzs2W7O1OA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "tslib": "^1.8.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 6"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "typescript": ">=2.8.0 || >= 3.2.0-dev || >= 3.3.0-dev || >= 3.4.0-dev || >= 3.5.0-dev || >= 3.6.0-dev || >= 3.6.0-beta || >= 3.7.0-dev || >= 3.7.0-beta"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/tsutils/node_modules/tslib": {[m
[32m+[m[32m      "version": "1.14.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/tslib/-/tslib-1.14.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-Xni35NKzjgMrwevysHTCArtLDpPvye8zV/0E4EyYn43P7/7qvQwPh9BGkHewbMulVntbigmcT7rdX3BNo9wRJg==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/type-check": {[m
[32m+[m[32m      "version": "0.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/type-check/-/type-check-0.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-XleUoc9uwGXqjWwXaUTZAmzMcFZ5858QA2vvx1Ur5xIcixXIP+8LnFDgRplU30us6teqdlskFfu+ae4K79Ooew==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "prelude-ls": "^1.2.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/type-fest": {[m
[32m+[m[32m      "version": "0.20.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/type-fest/-/type-fest-0.20.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-Ne+eE4r0/iWnpAxD852z3A+N0Bt5RN//NjJwRd2VFHEmrywxf5vsZlh4R6lixl6B+wz/8d+maTSAkN1FIkI3LQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/sindresorhus"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/typescript": {[m
[32m+[m[32m      "version": "4.8.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/typescript/-/typescript-4.8.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-QCh+85mCy+h0IGff8r5XWzOVSbBO+KfeYrMQh7NJ58QujwcE22u+NUSmUxqF+un70P9GXKxa2HCNiTTMJknyjQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "tsc": "bin/tsc",[m
[32m+[m[32m        "tsserver": "bin/tsserver"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4.2.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/unbox-primitive": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/unbox-primitive/-/unbox-primitive-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-61pPlCD9h51VoreyJ0BReideM3MDKMKnh6+V9L08331ipq6Q8OFXZYiqP6n/tbHx4s5I9uRhcye6BrbkizkBDw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.2",[m
[32m+[m[32m        "has-bigints": "^1.0.2",[m
[32m+[m[32m        "has-symbols": "^1.0.3",[m
[32m+[m[32m        "which-boxed-primitive": "^1.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/uncontrollable": {[m
[32m+[m[32m      "version": "7.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/uncontrollable/-/uncontrollable-7.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-svtcfoTADIB0nT9nltgjujTi7BzVmwjZClOmskKu/E8FW9BXzg9os8OLr4f8Dlnk0rYWJIWr4wv9eKUXiQvQwQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.6.3",[m
[32m+[m[32m        "@types/react": ">=16.9.11",[m
[32m+[m[32m        "invariant": "^2.2.4",[m
[32m+[m[32m        "react-lifecycles-compat": "^3.0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": ">=15.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/uri-js": {[m
[32m+[m[32m      "version": "4.4.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/uri-js/-/uri-js-4.4.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-7rKUyy33Q1yc98pQ1DAmLtwX109F7TIfWlW1Ydo8Wl1ii1SeHieeh0HHfPeL2fMXK6z0s8ecKs9frCuLJvndBg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "punycode": "^2.1.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/use-sync-external-store": {[m
[32m+[m[32m      "version": "1.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/use-sync-external-store/-/use-sync-external-store-1.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-eEgnFxGQ1Ife9bzYs6VLi8/4X6CObHMw9Qr9tPY43iKwsPw8xE8+EFsf/2cFZ5S3esXgpWgtSCtLNS41F+sKPA==",[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": "^16.8.0 || ^17.0.0 || ^18.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/warning": {[m
[32m+[m[32m      "version": "4.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/warning/-/warning-4.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-rpJyN222KWIvHJ/F53XSZv0Zl/accqHR8et1kpaMTD/fLCRxtV8iX8czMzY7sVZupTI3zcUTg8eycS2kNF9l6w==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "loose-envify": "^1.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/which": {[m
[32m+[m[32m      "version": "2.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/which/-/which-2.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-BLI3Tl1TW3Pvl70l3yq3Y64i+awpwXqsGBYWkkqMtnbXgrMD+yj7rhW0kuEDxzJaYXGjEW5ogapKNMEKNMjibA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "isexe": "^2.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "node-which": "bin/node-which"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/which-boxed-primitive": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/which-boxed-primitive/-/which-boxed-primitive-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-bwZdv0AKLpplFY2KZRX6TvyuN7ojjr7lwkg6ml0roIy9YeuSr7JS372qlNW18UQYzgYK9ziGcerWqZOmEn9VNg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "is-bigint": "^1.0.1",[m
[32m+[m[32m        "is-boolean-object": "^1.1.0",[m
[32m+[m[32m        "is-number-object": "^1.0.4",[m
[32m+[m[32m        "is-string": "^1.0.5",[m
[32m+[m[32m        "is-symbol": "^1.0.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/word-wrap": {[m
[32m+[m[32m      "version": "1.2.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/word-wrap/-/word-wrap-1.2.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-Hz/mrNwitNRh/HUAtM/VT/5VH+ygD6DV7mYKZAtHOrbs8U7lvPS6xf7EJKMF0uW1KJCl0H701g3ZGus+muE5vQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/wrappy": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-l4Sp/DRseor9wL6EvV2+TuQn63dMkPjZ/sp9XkghTEbV9KlPS1xUsZ3u7/IQO4wxtcFB4bgpQPRcR3QCvezPcQ==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/yallist": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-3wdGidZyq5PB084XLES5TpOSRA3wjXAlIWMhum2kRcv/41Sn2emQ0dycQW4uZXLejwKvg6EsvbdlVL+FYEct7A==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/yocto-queue": {[m
[32m+[m[32m      "version": "0.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/yocto-queue/-/yocto-queue-0.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-rVksvsnNCdJ/ohGc6xgPwyN8eheCxsiLM8mxuE/t/mOVqJewPuO1miLpTHQiRgTKCLexL4MeAFVagts7HmNZ2Q==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/sindresorhus"[m
[32m+[m[32m      }[m
[32m+[m[32m    }[m
[32m+[m[32m  },[m
   "dependencies": {[m
     "@babel/runtime": {[m
       "version": "7.20.0",[m
[36m@@ -406,7 +3874,8 @@[m
       "version": "5.3.2",[m
       "resolved": "https://registry.npmjs.org/acorn-jsx/-/acorn-jsx-5.3.2.tgz",[m
       "integrity": "sha512-rq9s+JNhf0IChjtDXxllJ7g41oZk5SlXtp0LHwyA5cejwn7vKmKp4pPri6YEePv2PU65sAsegbXtIinmDFDXgQ==",[m
[31m-      "dev": true[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "requires": {}[m
     },[m
     "ajv": {[m
       "version": "6.12.6",[m
[36m@@ -524,7 +3993,8 @@[m
     "bootstrap": {[m
       "version": "5.2.3",[m
       "resolved": "https://registry.npmjs.org/bootstrap/-/bootstrap-5.2.3.tgz",[m
[31m-      "integrity": "sha512-cEKPM+fwb3cT8NzQZYEu4HilJ3anCrWqh3CHAok1p9jXqMPsPTBhU25fBckEJHJ/p+tTxTFTsFQGM+gaHpi3QQ=="[m
[32m+[m[32m      "integrity": "sha512-cEKPM+fwb3cT8NzQZYEu4HilJ3anCrWqh3CHAok1p9jXqMPsPTBhU25fBckEJHJ/p+tTxTFTsFQGM+gaHpi3QQ==",[m
[32m+[m[32m      "requires": {}[m
     },[m
     "brace-expansion": {[m
       "version": "1.1.11",[m
[36m@@ -1024,7 +4494,8 @@[m
       "version": "4.6.0",[m
       "resolved": "https://registry.npmjs.org/eslint-plugin-react-hooks/-/eslint-plugin-react-hooks-4.6.0.tgz",[m
       "integrity": "sha512-oFc7Itz9Qxh2x4gNHStv3BqJq54ExXmfC+a1NjAta66IAN87Wu0R/QArgIS9qKzX3dXKPI9H5crl9QchNMY9+g==",[m
[31m-      "dev": true[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "requires": {}[m
     },[m
     "eslint-scope": {[m
       "version": "7.1.1",[m
[36m@@ -2369,7 +5840,8 @@[m
     "use-sync-external-store": {[m
       "version": "1.2.0",[m
       "resolved": "https://registry.npmjs.org/use-sync-external-store/-/use-sync-external-store-1.2.0.tgz",[m
[31m-      "integrity": "sha512-eEgnFxGQ1Ife9bzYs6VLi8/4X6CObHMw9Qr9tPY43iKwsPw8xE8+EFsf/2cFZ5S3esXgpWgtSCtLNS41F+sKPA=="[m
[32m+[m[32m      "integrity": "sha512-eEgnFxGQ1Ife9bzYs6VLi8/4X6CObHMw9Qr9tPY43iKwsPw8xE8+EFsf/2cFZ5S3esXgpWgtSCtLNS41F+sKPA==",[m
[32m+[m[32m      "requires": {}[m
     },[m
     "warning": {[m
       "version": "4.0.3",[m
[1mdiff --git a/handvask_frontend/src/components/AsyncBtn.tsx b/handvask_frontend/src/components/AsyncBtn.tsx[m
[1mindex 61e9513..53d7fe2 100644[m
[1m--- a/handvask_frontend/src/components/AsyncBtn.tsx[m
[1m+++ b/handvask_frontend/src/components/AsyncBtn.tsx[m
[36m@@ -1,6 +1,7 @@[m
 import { faSpinner } from "@fortawesome/free-solid-svg-icons";[m
 import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";[m
 import Button, { ButtonPropT } from "./Button";[m
[32m+[m[32mimport React from "react";[m
 [m
 type AsyncBtnPropT = {[m
   loading: boolean;[m
[1mdiff --git a/handvask_frontend/src/components/Base.tsx b/handvask_frontend/src/components/Base.tsx[m
[1mindex 780029c..7953d5b 100644[m
[1m--- a/handvask_frontend/src/components/Base.tsx[m
[1m+++ b/handvask_frontend/src/components/Base.tsx[m
[36m@@ -1,6 +1,7 @@[m
 import useUser from "../hooks/useUser";[m
 import Nav from "./Nav";[m
 import PageLoader from "./PageLoader";[m
[32m+[m[32mimport React from "react";[m
 [m
 type BasePropT = {[m
   children: React.ReactNode;[m
[1mdiff --git a/handvask_frontend/src/components/Button.tsx b/handvask_frontend/src/components/Button.tsx[m
[1mindex af38aa1..32bc9ca 100644[m
[1m--- a/handvask_frontend/src/components/Button.tsx[m
[1m+++ b/handvask_frontend/src/components/Button.tsx[m
[36m@@ -1,48 +1,49 @@[m
[31m-export type ButtonPropT = {[m
[31m-  kind:[m
[31m-    | "primary"[m
[31m-    | "secondary"[m
[31m-    | "success"[m
[31m-    | "danger"[m
[31m-    | "warning"[m
[31m-    | "info"[m
[31m-    | "light"[m
[31m-    | "dark"[m
[31m-    | "link";[m
[31m-  outline?: boolean;[m
[31m-  disabled?: boolean;[m
[31m-  large?: boolean;[m
[31m-  small?: boolean;[m
[31m-  onClick?: (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => void;[m
[31m-  className?: string;[m
[31m-  children?: React.ReactNode;[m
[31m-  type?: "button" | "submit" | "reset";[m
[31m-  style?: React.CSSProperties;[m
[31m-};[m
[31m-[m
[31m-export default function Button({[m
[31m-  kind,[m
[31m-  outline = false,[m
[31m-  disabled = false,[m
[31m-  large = false,[m
[31m-  small = false,[m
[31m-  onClick = (e) => null,[m
[31m-  className = "",[m
[31m-  children = "",[m
[31m-  type,[m
[31m-  style = {},[m
[31m-}: ButtonPropT) {[m
[31m-  return ([m
[31m-    <button[m
[31m-      type={type}[m
[31m-      className={`btn btn-${outline ? "outline-" : ""}${kind} ${[m
[31m-        disabled ? "disabled" : ""[m
[31m-      } ${large ? "btn-lg" : ""} ${small ? "btn-sm" : ""} ${className}`}[m
[31m-      onClick={onClick}[m
[31m-      disabled={disabled}[m
[31m-      style={style}[m
[31m-    >[m
[31m-      {children}[m
[31m-    </button>[m
[31m-  );[m
[31m-}[m
[32m+[m[32mimport React from "react";[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexport type ButtonPropT = {[m[41m[m
[32m+[m[32m  kind:[m[41m[m
[32m+[m[32m  | "primary"[m[41m[m
[32m+[m[32m  | "secondary"[m[41m[m
[32m+[m[32m  | "success"[m[41m[m
[32m+[m[32m  | "danger"[m[41m[m
[32m+[m[32m  | "warning"[m[41m[m
[32m+[m[32m  | "info"[m[41m[m
[32m+[m[32m  | "light"[m[41m[m
[32m+[m[32m  | "dark"[m[41m[m
[32m+[m[32m  | "link";[m[41m[m
[32m+[m[32m  outline?: boolean;[m[41m[m
[32m+[m[32m  disabled?: boolean;[m[41m[m
[32m+[m[32m  large?: boolean;[m[41m[m
[32m+[m[32m  small?: boolean;[m[41m[m
[32m+[m[32m  onClick?: (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => void;[m[41m[m
[32m+[m[32m  className?: string;[m[41m[m
[32m+[m[32m  children?: React.ReactNode;[m[41m[m
[32m+[m[32m  type?: "button" | "submit" | "reset";[m[41m[m
[32m+[m[32m  style?: React.CSSProperties;[m[41m[m
[32m+[m[32m};[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexport default function Button({[m[41m[m
[32m+[m[32m  kind,[m[41m[m
[32m+[m[32m  outline = false,[m[41m[m
[32m+[m[32m  disabled = false,[m[41m[m
[32m+[m[32m  large = false,[m[41m[m
[32m+[m[32m  small = false,[m[41m[m
[32m+[m[32m  onClick = (e) => null,[m[41m[m
[32m+[m[32m  className = "",[m[41m[m
[32m+[m[32m  children = "",[m[41m[m
[32m+[m[32m  type,[m[41m[m
[32m+[m[32m  style = {},[m[41m[m
[32m+[m[32m}: ButtonPropT) {[m[41m[m
[32m+[m[32m  return ([m[41m[m
[32m+[m[32m    <button[m[41m[m
[32m+[m[32m      type={type}[m[41m[m
[32m+[m[32m      className={`btn btn-${outline ? "outline-" : ""}${kind} ${disabled ? "disabled" : ""[m[41m[m
[32m+[m[32m        } ${large ? "btn-lg" : ""} ${small ? "btn-sm" : ""} ${className}`}[m[41m[m
[32m+[m[32m      onClick={onClick}[m[41m[m
[32m+[m[32m      disabled={disabled}[m[41m[m
[32m+[m[32m      style={style}[m[41m[m
[32m+[m[32m    >[m[41m[m
[32m+[m[32m      {children}[m[41m[m
[32m+[m[32m    </button>[m[41m[m
[32m+[m[32m  );[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/components/Home/InstanceModal.tsx b/handvask_frontend/src/components/Home/InstanceModal.tsx[m
[1mindex aa59b46..67539ed 100644[m
[1m--- a/handvask_frontend/src/components/Home/InstanceModal.tsx[m
[1m+++ b/handvask_frontend/src/components/Home/InstanceModal.tsx[m
[36m@@ -1,77 +1,79 @@[m
[31m-import { useState } from "react";[m
[31m-import useAPI from "../../hooks/useAPI";[m
[31m-import AsyncBtn from "../AsyncBtn";[m
[31m-import Button from "../Button";[m
[31m-import Modal from "../Modal";[m
[31m-[m
[31m-type InstanceModalPropT = {[m
[31m-  onClose: () => void;[m
[31m-  originalContents: string;[m
[31m-  originalName: string;[m
[31m-  id: number;[m
[31m-  type: "mzn" | "dzn";[m
[31m-  onUpdate: (id: number, newName: string, newContents: string) => void;[m
[31m-};[m
[31m-export default function InstanceModal({[m
[31m-  onClose,[m
[31m-  originalContents,[m
[31m-  originalName,[m
[31m-  id,[m
[31m-  onUpdate,[m
[31m-}: InstanceModalPropT) {[m
[31m-  const [contents, setContents] = useState(originalContents);[m
[31m-  const [name, setName] = useState(originalName);[m
[31m-  const [saving, setSaving] = useState(false);[m
[31m-  const { post } = useAPI();[m
[31m-[m
[31m-  function handleSave() {[m
[31m-    setSaving(true);[m
[31m-    post([m
[31m-      `/instances/mzn/${id}`,[m
[31m-      { contents: contents, friendly_name: name },[m
[31m-      (r) => {[m
[31m-        if (r.success) {[m
[31m-          onUpdate(id, name, contents);[m
[31m-          onClose();[m
[31m-        }[m
[31m-        setSaving(false);[m
[31m-      }[m
[31m-    );[m
[31m-  }[m
[31m-[m
[31m-  return ([m
[31m-    <Modal[m
[31m-      title="Edit instance"[m
[31m-      onClose={onClose}[m
[31m-      show={true}[m
[31m-      footer={[m
[31m-        <>[m
[31m-          <Button kind="secondary" onClick={onClose}>[m
[31m-            Cancel[m
[31m-          </Button>[m
[31m-          <AsyncBtn kind="success" onClick={handleSave} loading={saving}>[m
[31m-            Save[m
[31m-          </AsyncBtn>[m
[31m-        </>[m
[31m-      }[m
[31m-    >[m
[31m-      <div className="form-floating mb-3 w-100">[m
[31m-        <input[m
[31m-          type="string"[m
[31m-          className={`form-control`}[m
[31m-          id="nameInput"[m
[31m-          value={name}[m
[31m-          placeholder=" "[m
[31m-          onChange={(e) => setName(e.target.value)}[m
[31m-        />[m
[31m-        <label htmlFor="nameInput">Name</label>[m
[31m-      </div>[m
[31m-      <textarea[m
[31m-        className="form-control"[m
[31m-        style={{ minWidth: "50vw", minHeight: 200 }}[m
[31m-        value={contents}[m
[31m-        onChange={(e) => setContents(e.target.value)}[m
[31m-      />[m
[31m-    </Modal>[m
[31m-  );[m
[31m-}[m
[32m+[m[32mimport { useState } from "react";[m[41m[m
[32m+[m[32mimport useAPI from "../../hooks/useAPI";[m[41m[m
[32m+[m[32mimport AsyncBtn from "../AsyncBtn";[m[41m[m
[32m+[m[32mimport Button from "../Button";[m[41m[m
[32m+[m[32mimport Modal from "../Modal";[m[41m[m
[32m+[m[32mimport React from "react";[m[41m[m
[32m+[m[41m[m
[32m+[m[32mtype InstanceModalPropT = {[m[41m[m
[32m+[m[32m  onClose: () => void;[m[41m[m
[32m+[m[32m  originalContents: string;[m[41m[m
[32m+[m[32m  originalName: string;[m[41m[m
[32m+[m[32m  id: number;[m[41m[m
[32m+[m[32m  type: "mzn" | "dzn";[m[41m[m
[32m+[m[32m  onUpdate: (id: number, newName: string, newContents: string) => void;[m[41m[m
[32m+[m[32m};[m[41m[m
[32m+[m[32mexport default function InstanceModal({[m[41m[m
[32m+[m[32m  onClose,[m[41m[m
[32m+[m[32m  originalContents,[m[41m[m
[32m+[m[32m  originalName,[m[41m[m
[32m+[m[32m  id,[m[41m[m
[32m+[m[32m  type,[m[41m[m
[32m+[m[32m  onUpdate,[m[41m[m
[32m+[m[32m}: InstanceModalPropT) {[m[41m[m
[32m+[m[32m  const [contents, setContents] = useState(originalContents);[m[41m[m
[32m+[m[32m  const [name, setName] = useState(originalName);[m[41m[m
[32m+[m[32m  const [saving, setSaving] = useState(false);[m[41m[m
[32m+[m[32m  const { post } = useAPI();[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  function handleSave() {[m[41m[m
[32m+[m[32m    setSaving(true);[m[41m[m
[32m+[m[32m    post([m[41m[m
[32m+[m[32m      `/instances/${type}/${id}`,[m[41m[m
[32m+[m[32m      { contents: contents, friendly_name: name },[m[41m[m
[32m+[m[32m      (r) => {[m[41m[m
[32m+[m[32m        if (r.success) {[m[41m[m
[32m+[m[32m          onUpdate(id, name, contents);[m[41m[m
[32m+[m[32m          onClose();[m[41m[m
[32m+[m[32m        }[m[41m[m
[32m+[m[32m        setSaving(false);[m[41m[m
[32m+[m[32m      }[m[41m[m
[32m+[m[32m    );[m[41m[m
[32m+[m[32m  }[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  return ([m[41m[m
[32m+[m[32m    <Modal[m[41m[m
[32m+[m[32m      title="Edit instance"[m[41m[m
[32m+[m[32m      onClose={onClose}[m[41m[m
[32m+[m[32m      show={true}[m[41m[m
[32m+[m[32m      footer={[m[41m[m
[32m+[m[32m        <>[m[41m[m
[32m+[m[32m          <Button kind="secondary" onClick={onClose}>[m[41m[m
[32m+[m[32m            Cancel[m[41m[m
[32m+[m[32m          </Button>[m[41m[m
[32m+[m[32m          <AsyncBtn kind="success" onClick={handleSave} loading={saving}>[m[41m[m
[32m+[m[32m            Save[m[41m[m
[32m+[m[32m          </AsyncBtn>[m[41m[m
[32m+[m[32m        </>[m[41m[m
[32m+[m[32m      }[m[41m[m
[32m+[m[32m    >[m[41m[m
[32m+[m[32m      <div className="form-floating mb-3 w-100">[m[41m[m
[32m+[m[32m        <input[m[41m[m
[32m+[m[32m          type="string"[m[41m[m
[32m+[m[32m          className={`form-control`}[m[41m[m
[32m+[m[32m          id="nameInput"[m[41m[m
[32m+[m[32m          value={name}[m[41m[m
[32m+[m[32m          placeholder=" "[m[41m[m
[32m+[m[32m          onChange={(e) => setName(e.target.value)}[m[41m[m
[32m+[m[32m        />[m[41m[m
[32m+[m[32m        <label htmlFor="nameInput">Name</label>[m[41m[m
[32m+[m[32m      </div>[m[41m[m
[32m+[m[32m      <textarea[m[41m[m
[32m+[m[32m        className="form-control"[m[41m[m
[32m+[m[32m        style={{ minWidth: "50vw", minHeight: 200 }}[m[41m[m
[32m+[m[32m        value={contents}[m[41m[m
[32m+[m[32m        onChange={(e) => setContents(e.target.value)}[m[41m[m
[32m+[m[32m      />[m[41m[m
[32m+[m[32m    </Modal>[m[41m[m
[32m+[m[32m  );[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/components/Home/dzn.tsx b/handvask_frontend/src/components/Home/dzn.tsx[m
[1mindex 44ac8c1..a05cc17 100644[m
[1m--- a/handvask_frontend/src/components/Home/dzn.tsx[m
[1m+++ b/handvask_frontend/src/components/Home/dzn.tsx[m
[36m@@ -1,5 +1,134 @@[m
[31m-import { HomeSubpageBasePropT } from ".";[m
[31m-[m
[31m-export default function Dzn({ user }: HomeSubpageBasePropT) {[m
[31m-  return <p>dzn</p>;[m
[31m-}[m
[32m+[m[32mimport { faFile, faSpinner, faTrash } from "@fortawesome/free-solid-svg-icons";[m[41m[m
[32m+[m[32mimport { FontAwesomeIcon } from "@fortawesome/react-fontawesome";[m[41m[m
[32m+[m[32mimport { useEffect, useState } from "react";[m[41m[m
[32m+[m[32mimport { HomeSubpageBasePropT } from ".";[m[41m[m
[32m+[m[32mimport { listToUrlEncoded } from "../../functions";[m[41m[m
[32m+[m[32mimport useAPI from "../../hooks/useAPI";[m[41m[m
[32m+[m[32mimport AsyncBtn from "../AsyncBtn";[m[41m[m
[32m+[m[32mimport Button from "../Button";[m[41m[m
[32m+[m[32mimport InstanceModal from "./InstanceModal";[m[41m[m
[32m+[m[32mimport React from "react";[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexport default function Dzn({ user }: HomeSubpageBasePropT) {[m[41m[m
[32m+[m[32m  const [data, setData] = useState<DznInstance[]>();[m[41m[m
[32m+[m[32m  const { get, apiReady, post } = useAPI();[m[41m[m
[32m+[m[32m  const [showInstanceModal, setShowInstanceModal] = useState(false);[m[41m[m
[32m+[m[32m  const [selectedDzn, setSelectedDzn] = useState<DznInstance>();[m[41m[m
[32m+[m[32m  const [addingDzn, setAddingDzn] = useState(false);[m[41m[m
[32m+[m[32m  function onUpdate(id: number, newName: string, newContents: string) {[m[41m[m
[32m+[m[32m    setData((v) => {[m[41m[m
[32m+[m[32m      if (!v) return v;[m[41m[m
[32m+[m[32m      const x = [...v];[m[41m[m
[32m+[m[32m      x[v.findIndex((instance) => instance.id == id)].contents = newContents;[m[41m[m
[32m+[m[32m      x[v.findIndex((instance) => instance.id == id)].friendly_name = newName;[m[41m[m
[32m+[m[41m[m
[32m+[m[32m      return x;[m[41m[m
[32m+[m[32m    });[m[41m[m
[32m+[m[32m  }[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  function addDzn() {[m[41m[m
[32m+[m[32m    setAddingDzn(true);[m[41m[m
[32m+[m[32m    post<DznInstance>(`/instances/create_dzn`, "", (r) => {[m[41m[m
[32m+[m[32m      setData((v) => {[m[41m[m
[32m+[m[32m        if (!v) return v;[m[41m[m
[32m+[m[32m        console.log(v)[m[41m[m
[32m+[m[32m        return [...v, r];[m[41m[m
[32m+[m[32m      });[m[41m[m
[32m+[m[32m      user.addDzn(r.id);[m[41m[m
[32m+[m[32m      setAddingDzn(false);[m[41m[m
[32m+[m[32m    });[m[41m[m
[32m+[m[32m  }[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  function onCloseModal() {[m[41m[m
[32m+[m[32m    setSelectedDzn(undefined);[m[41m[m
[32m+[m[32m    setShowInstanceModal(false);[m[41m[m
[32m+[m[32m  }[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  function handleOpenDzn(instance: DznInstance) {[m[41m[m
[32m+[m[32m    setShowInstanceModal(true);[m[41m[m
[32m+[m[32m    setSelectedDzn(instance);[m[41m[m
[32m+[m[32m  }[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  useEffect(() => {[m[41m[m
[32m+[m[32m    if (apiReady && user.dzn_instances.length > 0) {[m[41m[m
[32m+[m[32m      get<DznInstance[]>([m[41m[m
[32m+[m[32m        `instances/dzn?${listToUrlEncoded(user.dzn_instances, "instance_ids")}`,[m[41m[m
[32m+[m[32m        (r) => {[m[41m[m
[32m+[m[32m          setData(r);[m[41m[m
[32m+[m[32m        }[m[41m[m
[32m+[m[32m      );[m[41m[m
[32m+[m[32m    } else if (user.dzn_instances.length === 0) {[m[41m[m
[32m+[m[32m      setData([]);[m[41m[m
[32m+[m[32m    }[m[41m[m
[32m+[m[32m  }, [apiReady]);[m[41m[m
[32m+[m[32m  return ([m[41m[m
[32m+[m[32m    <>[m[41m[m
[32m+[m[32m      <div className="d-flex flex-column align-items-center w-100">[m[41m[m
[32m+[m[32m        <AsyncBtn[m[41m[m
[32m+[m[32m          kind="success"[m[41m[m
[32m+[m[32m          loading={addingDzn}[m[41m[m
[32m+[m[32m          className="mb-3 fs-5"[m[41m[m
[32m+[m[32m          onClick={addDzn}[m[41m[m
[32m+[m[32m        >[m[41m[m
[32m+[m[32m          Add new instance![m[41m[m
[32m+[m[32m        </AsyncBtn>[m[41m[m
[32m+[m[32m        <table className="table table-striped table-hover">[m[41m[m
[32m+[m[32m          <thead>[m[41m[m
[32m+[m[32m            <tr>[m[41m[m
[32m+[m[32m              <td>ID</td>[m[41m[m
[32m+[m[32m              <td>Name</td>[m[41m[m
[32m+[m[32m              <td />[m[41m[m
[32m+[m[32m            </tr>[m[41m[m
[32m+[m[32m          </thead>[m[41m[m
[32m+[m[32m          <tbody>[m[41m[m
[32m+[m[32m            {data === undefined ? ([m[41m[m
[32m+[m[32m              <tr>[m[41m[m
[32m+[m[32m                <td colSpan={3} className="text-center">[m[41m[m
[32m+[m[32m                  <FontAwesomeIcon icon={faSpinner} spin />[m[41m[m
[32m+[m[32m                </td>[m[41m[m
[32m+[m[32m              </tr>[m[41m[m
[32m+[m[32m            ) : data.length > 0 ? ([m[41m[m
[32m+[m[32m              data.map((e) => ([m[41m[m
[32m+[m[32m                <tr key={e.id} style={{ lineHeight: "31px" }}>[m[41m[m
[32m+[m[32m                  <td>{e.id}</td>[m[41m[m
[32m+[m[32m                  <td>{e.friendly_name}</td>[m[41m[m
[32m+[m[32m                  <td className="text-end">[m[41m[m
[32m+[m[32m                    <div className="btn-group btn-group-sm">[m[41m[m
[32m+[m[32m                      <Button[m[41m[m
[32m+[m[32m                        kind="dark"[m[41m[m
[32m+[m[32m                        className=""[m[41m[m
[32m+[m[32m                        outline[m[41m[m
[32m+[m[32m                        onClick={() => handleOpenDzn(e)}[m[41m[m
[32m+[m[32m                      >[m[41m[m
[32m+[m[32m                        <FontAwesomeIcon icon={faFile} />[m[41m[m
[32m+[m[32m                      </Button>[m[41m[m
[32m+[m[32m                      <Button kind="danger" className="" outline>[m[41m[m
[32m+[m[32m                        <FontAwesomeIcon icon={faTrash} />[m[41m[m
[32m+[m[32m                      </Button>[m[41m[m
[32m+[m[32m                    </div>[m[41m[m
[32m+[m[32m                  </td>[m[41m[m
[32m+[m[32m                </tr>[m[41m[m
[32m+[m[32m              ))[m[41m[m
[32m+[m[32m            ) : ([m[41m[m
[32m+[m[32m              <tr>[m[41m[m
[32m+[m[32m                <td colSpan={3} className="text-center">[m[41m[m
[32m+[m[32m                  You don't have any Dzn instances yet, why don't you add one?[m[41m[m
[32m+[m[32m                </td>[m[41m[m
[32m+[m[32m              </tr>[m[41m[m
[32m+[m[32m            )}[m[41m[m
[32m+[m[32m          </tbody>[m[41m[m
[32m+[m[32m        </table>[m[41m[m
[32m+[m[32m      </div>[m[41m[m
[32m+[m[32m      {showInstanceModal && selectedDzn ? ([m[41m[m
[32m+[m[32m        <InstanceModal[m[41m[m
[32m+[m[32m          onClose={onCloseModal}[m[41m[m
[32m+[m[32m          originalContents={selectedDzn.contents ?? ""}[m[41m[m
[32m+[m[32m          originalName={selectedDzn.friendly_name}[m[41m[m
[32m+[m[32m          id={selectedDzn.id}[m[41m[m
[32m+[m[32m          type="dzn"[m[41m[m
[32m+[m[32m          onUpdate={onUpdate}[m[41m[m
[32m+[m[32m        />[m[41m[m
[32m+[m[32m      ) : null}[m[41m[m
[32m+[m[32m    </>[m[41m[m
[32m+[m[32m  );[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/components/Home/index.tsx b/handvask_frontend/src/components/Home/index.tsx[m
[1mindex 99bb6ab..e4f9a5a 100644[m
[1m--- a/handvask_frontend/src/components/Home/index.tsx[m
[1m+++ b/handvask_frontend/src/components/Home/index.tsx[m
[36m@@ -1,109 +1,98 @@[m
[31m-import React, { useEffect, useState } from "react";[m
[31m-import { httpGet } from "../../functions";[m
[31m-import useUser from "../../hooks/useUser";[m
[31m-import Table from "react-bootstrap/Table";[m
[31m-import "bootstrap/dist/css/bootstrap.min.css";[m
[31m-import Button from "../Button";[m
[31m-import Link from "next/link";[m
[31m-import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";[m
[31m-import { faBars } from "@fortawesome/free-solid-svg-icons";[m
[31m-import Base from "../Base";[m
[31m-import SideBarButton from "../SideBarButton";[m
[31m-import Runs from "./runs";[m
[31m-import Dzn from "./dzn";[m
[31m-import Mzn from "./mzn";[m
[31m-[m
[31m-export type HomeSubpageBasePropT = {[m
[31m-  user: User;[m
[31m-};[m
[31m-[m
[31m-export default function Home() {[m
[31m-  const [sideOpen, setSideOpen] = useState(true);[m
[31m-  const user = useUser();[m
[31m-  const [currentPage, setCurrentPage] = useState<string>("runs");[m
[31m-  const tableRows = ([m
[31m-    <tr>[m
[31m-      <td>{user?.dzn_instances}</td>[m
[31m-      <td>{user?.mzn_instances}</td>[m
[31m-      <td>{user?.runs}</td>[m
[31m-    </tr>[m
[31m-  );[m
[31m-  useEffect(() => {[m
[31m-    console.log(user);[m
[31m-  }, [user]);[m
[31m-[m
[31m-  return ([m
[31m-    <Base>[m
[31m-      {(user && ([m
[31m-        <div className="d-flex w-100">[m
[31m-          <div[m
[31m-            className="position-relative"[m
[31m-            style={{[m
[31m-              transition: "all .3s",[m
[31m-              width: sideOpen ? 150 : 0,[m
[31m-            }}[m
[31m-          >[m
[31m-            <Button[m
[31m-              className="position-absolute top-0 end-0 w-2 h-2 border-none"[m
[31m-              kind={"dark"}[m
[31m-              style={{[m
[31m-                transform: "translateX(100%)",[m
[31m-                borderRadius: "0 .375rem .375rem 0",[m
[31m-              }}[m
[31m-              onClick={() => setSideOpen((v) => !v)}[m
[31m-            >[m
[31m-              <FontAwesomeIcon icon={faBars} />[m
[31m-            </Button>[m
[31m-            <div[m
[31m-              className={`d-flex justify-content-start flex-column align-items-left bg-light pt-5 border-end px-4`}[m
[31m-              style={{[m
[31m-                height: "calc(100vh - 56px)",[m
[31m-                opacity: sideOpen ? 1 : 0,[m
[31m-                transform: sideOpen ? "translateX(0)" : "translateX(-100%)",[m
[31m-                transition: "all .2s",[m
[31m-                whiteSpace: "nowrap",[m
[31m-              }}[m
[31m-            >[m
[31m-              <SideBarButton[m
[31m-                name="Runs"[m
[31m-                active={currentPage == "runs"}[m
[31m-                trigger={() => setCurrentPage("runs")}[m
[31m-              />[m
[31m-              <SideBarButton[m
[31m-                name=".mzn instances"[m
[31m-                active={currentPage == "mzn"}[m
[31m-                trigger={() => setCurrentPage("mzn")}[m
[31m-              />[m
[31m-              <SideBarButton[m
[31m-                name=".dzn instances"[m
[31m-                active={currentPage == "dzn"}[m
[31m-                trigger={() => setCurrentPage("dzn")}[m
[31m-              />[m
[31m-            </div>[m
[31m-          </div>[m
[31m-          <div[m
[31m-            className={`container-fluid d-flex justify-content-center align-items-start shadow-sm p-5`}[m
[31m-            style={{[m
[31m-              transition: "all .3s",[m
[31m-              width: sideOpen ? "calc(100% - 150px)" : "100%",[m
[31m-            }}[m
[31m-          >[m
[31m-            {(currentPage == "runs" && <Runs user={user} />) ||[m
[31m-              (currentPage == "dzn" && <Dzn user={user} />) ||[m
[31m-              (currentPage == "mzn" && <Mzn user={user} />) || <></>}[m
[31m-          </div>[m
[31m-          {/* <Table hover>[m
[31m-          <thead>[m
[31m-            <tr>[m
[31m-              <th> Dzn instances</th>[m
[31m-              <th> Mzn Instances</th>[m
[31m-              <th> Runs</th>[m
[31m-            </tr>[m
[31m-          </thead>[m
[31m-          <tbody>{tableRows}</tbody>[m
[31m-        </Table> */}[m
[31m-        </div>[m
[31m-      )) || <></>}[m
[31m-    </Base>[m
[31m-  );[m
[31m-}[m
[32m+[m[32mimport React, { useEffect, useState } from "react";[m[41m[m
[32m+[m[32mimport useUser, { ExpandedUser } from "../../hooks/useUser";[m[41m[m
[32m+[m[32mimport "bootstrap/dist/css/bootstrap.min.css";[m[41m[m
[32m+[m[32mimport Button from "../Button";[m[41m[m
[32m+[m[32mimport { FontAwesomeIcon } from "@fortawesome/react-fontawesome";[m[41m[m
[32m+[m[32mimport { faBars } from "@fortawesome/free-solid-svg-icons";[m[41m[m
[32m+[m[32mimport Base from "../Base";[m[41m[m
[32m+[m[32mimport SideBarButton from "../SideBarButton";[m[41m[m
[32m+[m[32mimport Runs from "./runs";[m[41m[m
[32m+[m[32mimport Dzn from "./dzn";[m[41m[m
[32m+[m[32mimport Mzn from "./mzn";[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexport type HomeSubpageBasePropT = {[m[41m[m
[32m+[m[32m  user: ExpandedUser;[m[41m[m
[32m+[m[32m};[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexport default function Home() {[m[41m[m
[32m+[m[32m  const [sideOpen, setSideOpen] = useState(true);[m[41m[m
[32m+[m[32m  const user = useUser();[m[41m[m
[32m+[m[32m  const [currentPage, setCurrentPage] = useState<string>("runs");[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  return ([m[41m[m
[32m+[m[32m    <Base>[m[41m[m
[32m+[m[32m      {(user && ([m[41m[m
[32m+[m[32m        <div className="d-flex w-100">[m[41m[m
[32m+[m[32m          <div[m[41m[m
[32m+[m[32m            className="position-relative"[m[41m[m
[32m+[m[32m            style={{[m[41m[m
[32m+[m[32m              transition: "all .3s",[m[41m[m
[32m+[m[32m              width: sideOpen ? 150 : 0,[m[41m[m
[32m+[m[32m            }}[m[41m[m
[32m+[m[32m          >[m[41m[m
[32m+[m[32m            <Button[m[41m[m
[32m+[m[32m              className="position-absolute top-0 end-0 w-2 h-2 border-none"[m[41m[m
[32m+[m[32m              kind={"dark"}[m[41m[m
[32m+[m[32m              style={{[m[41m[m
[32m+[m[32m                transform: "translateX(100%)",[m[41m[m
[32m+[m[32m                borderRadius: "0 .375rem .375rem 0",[m[41m[m
[32m+[m[32m              }}[m[41m[m
[32m+[m[32m              onClick={() => setSideOpen((v) => !v)}[m[41m[m
[32m+[m[32m            >[m[41m[m
[32m+[m[32m              <FontAwesomeIcon icon={faBars} />[m[41m[m
[32m+[m[32m            </Button>[m[41m[m
[32m+[m[32m            <div[m[41m[m
[32m+[m[32m              className={`d-flex justify-content-start flex-column align-items-left bg-light pt-5 border-end px-4`}[m[41m[m
[32m+[m[32m              style={{[m[41m[m
[32m+[m[32m                height: "calc(100vh - 56px)",[m[41m[m
[32m+[m[32m                opacity: sideOpen ? 1 : 0,[m[41m[m
[32m+[m[32m                transform: sideOpen ? "translateX(0)" : "translateX(-100%)",[m[41m[m
[32m+[m[32m                transition: "all .2s",[m[41m[m
[32m+[m[32m                whiteSpace: "nowrap",[m[41m[m
[32m+[m[32m              }}[m[41m[m
[32m+[m[32m            >[m[41m[m
[32m+[m[32m              <SideBarButton[m[41m[m
[32m+[m[32m                name="Runs"[m[41m[m
[32m+[m[32m                active={currentPage == "runs"}[m[41m[m
[32m+[m[32m                trigger={() => setCurrentPage("runs")}[m[41m[m
[32m+[m[32m              />[m[41m[m
[32m+[m[32m              <SideBarButton[m[41m[m
[32m+[m[32m                name=".mzn instances"[m[41m[m
[32m+[m[32m                active={currentPage == "mzn"}[m[41m[m
[32m+[m[32m                trigger={() => setCurrentPage("mzn")}[m[41m[m
[32m+[m[32m              />[m[41m[m
[32m+[m[32m              <SideBarButton[m[41m[m
[32m+[m[32m                name=".dzn instances"[m[41m[m
[32m+[m[32m                active={currentPage == "dzn"}[m[41m[m
[32m+[m[32m                trigger={() => setCurrentPage("dzn")}[m[41m[m
[32m+[m[32m              />[m[41m[m
[32m+[m[32m            </div>[m[41m[m
[32m+[m[32m          </div>[m[41m[m
[32m+[m[32m          <div[m[41m[m
[32m+[m[32m            className={`container-fluid d-flex justify-content-center align-items-start shadow-sm p-5`}[m[41m[m
[32m+[m[32m            style={{[m[41m[m
[32m+[m[32m              transition: "all .3s",[m[41m[m
[32m+[m[32m              width: sideOpen ? "calc(100% - 150px)" : "100%",[m[41m[m
[32m+[m[32m            }}[m[41m[m
[32m+[m[32m          >[m[41m[m
[32m+[m[32m            {(currentPage == "runs" && <Runs user={user} />) ||[m[41m[m
[32m+[m[32m              (currentPage == "dzn" && <Dzn user={user} />) ||[m[41m[m
[32m+[m[32m              (currentPage == "mzn" && <Mzn user={user} />) ||[m[41m[m
[32m+[m[32m              null}[m[41m[m
[32m+[m[32m          </div>[m[41m[m
[32m+[m[32m          {/* <Table hover>[m[41m[m
[32m+[m[32m          <thead>[m[41m[m
[32m+[m[32m            <tr>[m[41m[m
[32m+[m[32m              <th> Dzn instances</th>[m[41m[m
[32m+[m[32m              <th> Mzn Instances</th>[m[41m[m
[32m+[m[32m              <th> Runs</th>[m[41m[m
[32m+[m[32m            </tr>[m[41m[m
[32m+[m[32m          </thead>[m[41m[m
[32m+[m[32m          <tbody>{tableRows}</tbody>[m[41m[m
[32m+[m[32m        </Table> */}[m[41m[m
[32m+[m[32m        </div>[m[41m[m
[32m+[m[32m      )) ||[m[41m[m
[32m+[m[32m        null}[m[41m[m
[32m+[m[32m    </Base>[m[41m[m
[32m+[m[32m  );[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/components/Home/mzn.tsx b/handvask_frontend/src/components/Home/mzn.tsx[m
[1mindex 45455d4..cb4244b 100644[m
[1m--- a/handvask_frontend/src/components/Home/mzn.tsx[m
[1m+++ b/handvask_frontend/src/components/Home/mzn.tsx[m
[36m@@ -1,99 +1,133 @@[m
[31m-import { faFile, faSpinner, faTrash } from "@fortawesome/free-solid-svg-icons";[m
[31m-import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";[m
[31m-import { useEffect, useState } from "react";[m
[31m-import { HomeSubpageBasePropT } from ".";[m
[31m-import { listToUrlEncoded } from "../../functions";[m
[31m-import useAPI from "../../hooks/useAPI";[m
[31m-import Button from "../Button";[m
[31m-import InstanceModal from "./InstanceModal";[m
[31m-[m
[31m-export default function Mzn({ user }: HomeSubpageBasePropT) {[m
[31m-  const [data, setData] = useState<MznInstance[]>();[m
[31m-  const { get, apiReady } = useAPI();[m
[31m-  const [showInstanceModal, setShowInstanceModal] = useState(false);[m
[31m-  const [selectedMzn, setSelectedMzn] = useState<MznInstance>();[m
[31m-  function onUpdate(id: number, newName: string, newContents: string) {[m
[31m-    setData((v) => {[m
[31m-      if (!v) return v;[m
[31m-      const x = [...v];[m
[31m-      x[v.findIndex((instance) => instance.id == id)].contents = newContents;[m
[31m-      x[v.findIndex((instance) => instance.id == id)].friendly_name = newName;[m
[31m-[m
[31m-      console.log(x);[m
[31m-      return x;[m
[31m-    });[m
[31m-  }[m
[31m-[m
[31m-  useEffect(() => {[m
[31m-    if (apiReady) {[m
[31m-      get<MznInstance[]>([m
[31m-        `instances/mzn?${listToUrlEncoded(user.mzn_instances, "instance_ids")}`,[m
[31m-        (r) => {[m
[31m-          setData(r);[m
[31m-        }[m
[31m-      );[m
[31m-    }[m
[31m-  }, [apiReady]);[m
[31m-  return ([m
[31m-    <>[m
[31m-      <table className="table table-striped table-hover table-">[m
[31m-        <thead>[m
[31m-          <tr>[m
[31m-            <td>ID</td>[m
[31m-            <td>Name</td>[m
[31m-            <td />[m
[31m-          </tr>[m
[31m-        </thead>[m
[31m-        <tbody>[m
[31m-          {data == undefined ? ([m
[31m-            <tr>[m
[31m-              <td colSpan={3} className="text-center">[m
[31m-                <FontAwesomeIcon icon={faSpinner} spin />[m
[31m-              </td>[m
[31m-            </tr>[m
[31m-          ) : ([m
[31m-            data.map((e, i) => ([m
[31m-              <tr key={i} style={{ lineHeight: "31px" }}>[m
[31m-                <td>{e.id}</td>[m
[31m-                <td>{e.friendly_name}</td>[m
[31m-                <td className="text-end">[m
[31m-                  <div className="btn-group btn-group-sm">[m
[31m-                    <Button[m
[31m-                      kind="dark"[m
[31m-                      className=""[m
[31m-                      outline[m
[31m-                      onClick={() => {[m
[31m-                        setShowInstanceModal(true);[m
[31m-                        setSelectedMzn(e);[m
[31m-                      }}[m
[31m-                    >[m
[31m-                      <FontAwesomeIcon icon={faFile} />[m
[31m-                    </Button>[m
[31m-                    <Button kind="danger" className="" outline>[m
[31m-                      <FontAwesomeIcon icon={faTrash} />[m
[31m-                    </Button>[m
[31m-                  </div>[m
[31m-                </td>[m
[31m-              </tr>[m
[31m-            ))[m
[31m-          )}[m
[31m-        </tbody>[m
[31m-      </table>[m
[31m-      {showInstanceModal && selectedMzn ? ([m
[31m-        <InstanceModal[m
[31m-          onClose={() => {[m
[31m-            setSelectedMzn(undefined);[m
[31m-            setShowInstanceModal(false);[m
[31m-          }}[m
[31m-          originalContents={selectedMzn.contents ?? ""}[m
[31m-          originalName={selectedMzn.friendly_name}[m
[31m-          id={selectedMzn.id}[m
[31m-          type="mzn"[m
[31m-          onUpdate={onUpdate}[m
[31m-        />[m
[31m-      ) : ([m
[31m-        <></>[m
[31m-      )}[m
[31m-    </>[m
[31m-  );[m
[31m-}[m
[32m+[m[32mimport { faFile, faSpinner, faTrash } from "@fortawesome/free-solid-svg-icons";[m[41m[m
[32m+[m[32mimport { FontAwesomeIcon } from "@fortawesome/react-fontawesome";[m[41m[m
[32m+[m[32mimport { useEffect, useState } from "react";[m[41m[m
[32m+[m[32mimport { HomeSubpageBasePropT } from ".";[m[41m[m
[32m+[m[32mimport { listToUrlEncoded } from "../../functions";[m[41m[m
[32m+[m[32mimport useAPI from "../../hooks/useAPI";[m[41m[m
[32m+[m[32mimport AsyncBtn from "../AsyncBtn";[m[41m[m
[32m+[m[32mimport Button from "../Button";[m[41m[m
[32m+[m[32mimport InstanceModal from "./InstanceModal";[m[41m[m
[32m+[m[32mimport React from "react";[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexport default function Mzn({ user }: HomeSubpageBasePropT) {[m[41m[m
[32m+[m[32m  const [data, setData] = useState<MznInstance[]>();[m[41m[m
[32m+[m[32m  const { get, apiReady, post } = useAPI();[m[41m[m
[32m+[m[32m  const [showInstanceModal, setShowInstanceModal] = useState(false);[m[41m[m
[32m+[m[32m  const [selectedMzn, setSelectedMzn] = useState<MznInstance>();[m[41m[m
[32m+[m[32m  const [addingMzn, setAddingMzn] = useState(false);[m[41m[m
[32m+[m[32m  function onUpdate(id: number, newName: string, newContents: string) {[m[41m[m
[32m+[m[32m    setData((v) => {[m[41m[m
[32m+[m[32m      if (!v) return v;[m[41m[m
[32m+[m[32m      const x = [...v];[m[41m[m
[32m+[m[32m      x[v.findIndex((instance) => instance.id == id)].contents = newContents;[m[41m[m
[32m+[m[32m      x[v.findIndex((instance) => instance.id == id)].friendly_name = newName;[m[41m[m
[32m+[m[41m[m
[32m+[m[32m      return x;[m[41m[m
[32m+[m[32m    });[m[41m[m
[32m+[m[32m  }[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  function addMzn() {[m[41m[m
[32m+[m[32m    setAddingMzn(true);[m[41m[m
[32m+[m[32m    post<MznInstance>(`/instances/create_mzn`, "", (r) => {[m[41m[m
[32m+[m[32m      setData((v) => {[m[41m[m
[32m+[m[32m        if (!v) return v;[m[41m[m
[32m+[m[32m        return [...v, r];[m[41m[m
[32m+[m[32m      });[m[41m[m
[32m+[m[32m      user.addMzn(r.id);[m[41m[m
[32m+[m[32m      setAddingMzn(false);[m[41m[m
[32m+[m[32m    });[m[41m[m
[32m+[m[32m  }[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  function onCloseModal() {[m[41m[m
[32m+[m[32m    setSelectedMzn(undefined);[m[41m[m
[32m+[m[32m    setShowInstanceModal(false);[m[41m[m
[32m+[m[32m  }[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  function handleOpenMzn(instance: MznInstance) {[m[41m[m
[32m+[m[32m    setShowInstanceModal(true);[m[41m[m
[32m+[m[32m    setSelectedMzn(instance);[m[41m[m
[32m+[m[32m  }[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  useEffect(() => {[m[41m[m
[32m+[m[32m    if (apiReady && user.mzn_instances.length > 0) {[m[41m[m
[32m+[m[32m      get<MznInstance[]>([m[41m[m
[32m+[m[32m        `instances/mzn?${listToUrlEncoded(user.mzn_instances, "instance_ids")}`,[m[41m[m
[32m+[m[32m        (r) => {[m[41m[m
[32m+[m[32m          setData(r);[m[41m[m
[32m+[m[32m        }[m[41m[m
[32m+[m[32m      );[m[41m[m
[32m+[m[32m    } else if (user.mzn_instances.length === 0) {[m[41m[m
[32m+[m[32m      setData([]);[m[41m[m
[32m+[m[32m    }[m[41m[m
[32m+[m[32m  }, [apiReady]);[m[41m[m
[32m+[m[32m  return ([m[41m[m
[32m+[m[32m    <>[m[41m[m
[32m+[m[32m      <div className="d-flex flex-column align-items-center w-100">[m[41m[m
[32m+[m[32m        <AsyncBtn[m[41m[m
[32m+[m[32m          kind="success"[m[41m[m
[32m+[m[32m          loading={addingMzn}[m[41m[m
[32m+[m[32m          className="mb-3 fs-5"[m[41m[m
[32m+[m[32m          onClick={addMzn}[m[41m[m
[32m+[m[32m        >[m[41m[m
[32m+[m[32m          Add new instance![m[41m[m
[32m+[m[32m        </AsyncBtn>[m[41m[m
[32m+[m[32m        <table className="table table-striped table-hover">[m[41m[m
[32m+[m[32m          <thead>[m[41m[m
[32m+[m[32m            <tr>[m[41m[m
[32m+[m[32m              <td>ID</td>[m[41m[m
[32m+[m[32m              <td>Name</td>[m[41m[m
[32m+[m[32m              <td />[m[41m[m
[32m+[m[32m            </tr>[m[41m[m
[32m+[m[32m          </thead>[m[41m[m
[32m+[m[32m          <tbody>[m[41m[m
[32m+[m[32m            {data === undefined ? ([m[41m[m
[32m+[m[32m              <tr>[m[41m[m
[32m+[m[32m                <td colSpan={3} className="text-center">[m[41m[m
[32m+[m[32m                  <FontAwesomeIcon icon={faSpinner} spin />[m[41m[m
[32m+[m[32m                </td>[m[41m[m
[32m+[m[32m              </tr>[m[41m[m
[32m+[m[32m            ) : data.length > 0 ? ([m[41m[m
[32m+[m[32m              data.map((e) => ([m[41m[m
[32m+[m[32m                <tr key={e.id} style={{ lineHeight: "31px" }}>[m[41m[m
[32m+[m[32m                  <td>{e.id}</td>[m[41m[m
[32m+[m[32m                  <td>{e.friendly_name}</td>[m[41m[m
[32m+[m[32m                  <td className="text-end">[m[41m[m
[32m+[m[32m                    <div className="btn-group btn-group-sm">[m[41m[m
[32m+[m[32m                      <Button[m[41m[m
[32m+[m[32m                        kind="dark"[m[41m[m
[32m+[m[32m                        className=""[m[41m[m
[32m+[m[32m                        outline[m[41m[m
[32m+[m[32m                        onClick={() => handleOpenMzn(e)}[m[41m[m
[32m+[m[32m                      >[m[41m[m
[32m+[m[32m                        <FontAwesomeIcon icon={faFile} />[m[41m[m
[32m+[m[32m                      </Button>[m[41m[m
[32m+[m[32m                      <Button kind="danger" className="" outline>[m[41m[m
[32m+[m[32m                        <FontAwesomeIcon icon={faTrash} />[m[41m[m
[32m+[m[32m                      </Button>[m[41m[m
[32m+[m[32m                    </div>[m[41m[m
[32m+[m[32m                  </td>[m[41m[m
[32m+[m[32m                </tr>[m[41m[m
[32m+[m[32m              ))[m[41m[m
[32m+[m[32m            ) : ([m[41m[m
[32m+[m[32m              <tr>[m[41m[m
[32m+[m[32m                <td colSpan={3} className="text-center">[m[41m[m
[32m+[m[32m                  You don't have any mzn instances yet, why don't you add one?[m[41m[m
[32m+[m[32m                </td>[m[41m[m
[32m+[m[32m              </tr>[m[41m[m
[32m+[m[32m            )}[m[41m[m
[32m+[m[32m          </tbody>[m[41m[m
[32m+[m[32m        </table>[m[41m[m
[32m+[m[32m      </div>[m[41m[m
[32m+[m[32m      {showInstanceModal && selectedMzn ? ([m[41m[m
[32m+[m[32m        <InstanceModal[m[41m[m
[32m+[m[32m          onClose={onCloseModal}[m[41m[m
[32m+[m[32m          originalContents={selectedMzn.contents ?? ""}[m[41m[m
[32m+[m[32m          originalName={selectedMzn.friendly_name}[m[41m[m
[32m+[m[32m          id={selectedMzn.id}[m[41m[m
[32m+[m[32m          type="mzn"[m[41m[m
[32m+[m[32m          onUpdate={onUpdate}[m[41m[m
[32m+[m[32m        />[m[41m[m
[32m+[m[32m      ) : null}[m[41m[m
[32m+[m[32m    </>[m[41m[m
[32m+[m[32m  );[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/components/Home/runs.tsx b/handvask_frontend/src/components/Home/runs.tsx[m
[1mindex 15fcd64..f9159b7 100644[m
[1m--- a/handvask_frontend/src/components/Home/runs.tsx[m
[1m+++ b/handvask_frontend/src/components/Home/runs.tsx[m
[36m@@ -1,9 +1,10 @@[m
[31m-import { HomeSubpageBasePropT } from ".";[m
[31m-[m
[31m-export default function Runs({ user }: HomeSubpageBasePropT) {[m
[31m-  return ([m
[31m-    <h1 className="display-5 text-center fw-bold mb-5">[m
[31m-      Welcome {user?.username}![m
[31m-    </h1>[m
[31m-  );[m
[31m-}[m
[32m+[m[32mimport { HomeSubpageBasePropT } from ".";[m[41m[m
[32m+[m[32mimport React from "react";[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexport default function Runs({ user }: HomeSubpageBasePropT) {[m[41m[m
[32m+[m[32m  return ([m[41m[m
[32m+[m[32m    <h1 className="display-5 text-center fw-bold mb-5">[m[41m[m
[32m+[m[32m      Welcome {user?.username}![m[41m[m
[32m+[m[32m    </h1>[m[41m[m
[32m+[m[32m  );[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/components/Modal.tsx b/handvask_frontend/src/components/Modal.tsx[m
[1mindex 646b960..f7a1ac0 100644[m
[1m--- a/handvask_frontend/src/components/Modal.tsx[m
[1m+++ b/handvask_frontend/src/components/Modal.tsx[m
[36m@@ -1,79 +1,81 @@[m
[31m-import { useEffect, useMemo, useState } from "react";[m
[31m-import { guuid } from "../functions";[m
[31m-[m
[31m-type modalProps = {[m
[31m-  show?: boolean;[m
[31m-  title: React.ReactNode;[m
[31m-  children: React.ReactNode;[m
[31m-  footer?: React.ReactNode;[m
[31m-  onClose: () => void;[m
[31m-};[m
[31m-[m
[31m-export default function Modal({[m
[31m-  show = false,[m
[31m-  title,[m
[31m-  children,[m
[31m-  footer,[m
[31m-  onClose,[m
[31m-}: modalProps) {[m
[31m-  const [id, setId] = useState<string>();[m
[31m-[m
[31m-  useEffect(() => {[m
[31m-    setId(guuid());[m
[31m-  }, []);[m
[31m-[m
[31m-  function handleKey(e: KeyboardEvent) {[m
[31m-    if (e.keyCode == 27) {[m
[31m-      onClose();[m
[31m-    }[m
[31m-  }[m
[31m-[m
[31m-  useEffect(() => {[m
[31m-    document.addEventListener("keydown", handleKey);[m
[31m-    return () => document.removeEventListener("keydown", handleKey);[m
[31m-  }, []);[m
[31m-[m
[31m-  const dClass = useMemo(() => {[m
[31m-    return show ? { display: "flex" } : {};[m
[31m-  }, [show]);[m
[31m-[m
[31m-  return ([m
[31m-    <div[m
[31m-      className={`modal  fade${show ? " show" : ""}`}[m
[31m-      id={id}[m
[31m-      tabIndex={-1}[m
[31m-      data-bs-backdrop="static"[m
[31m-      data-bs-keyboard="false"[m
[31m-      role="dialog"[m
[31m-      aria-labelledby={id + "_title"}[m
[31m-      aria-hidden="true"[m
[31m-      style={{ ...dClass }}[m
[31m-    >[m
[31m-      <div[m
[31m-        className="modal-backdrop-custom bg-dark bg-opacity-50 vw-100 vh-100 position-fixed"[m
[31m-        onClick={onClose}[m
[31m-       />[m
[31m-      <div[m
[31m-        className="modal-dialog modal-xl modal-dialog-scrollable modal-dialog-centered modal-sm"[m
[31m-        role="document"[m
[31m-      >[m
[31m-        <div className="modal-content">[m
[31m-          <div className="modal-header">[m
[31m-            <h5 className="modal-title" id={id + "_title"}>[m
[31m-              {title}[m
[31m-            </h5>[m
[31m-            <button[m
[31m-              type="button"[m
[31m-              className="btn-close"[m
[31m-              data-bs-dismiss="modal"[m
[31m-              aria-label="Close"[m
[31m-              onClick={onClose}[m
[31m-             />[m
[31m-          </div>[m
[31m-          <div className="modal-body">{children}</div>[m
[31m-          {(footer && <div className="modal-footer">{footer}</div>) || <></>}[m
[31m-        </div>[m
[31m-      </div>[m
[31m-    </div>[m
[31m-  );[m
[31m-}[m
[32m+[m[32mimport { useEffect, useMemo, useState } from "react";[m[41m[m
[32m+[m[32mimport { guuid } from "../functions";[m[41m[m
[32m+[m[32mimport React from "react";[m[41m[m
[32m+[m[41m[m
[32m+[m[32mtype modalProps = {[m[41m[m
[32m+[m[32m  show?: boolean;[m[41m[m
[32m+[m[32m  title: React.ReactNode;[m[41m[m
[32m+[m[32m  children: React.ReactNode;[m[41m[m
[32m+[m[32m  footer?: React.ReactNode;[m[41m[m
[32m+[m[32m  onClose: () => void;[m[41m[m
[32m+[m[32m};[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexport default function Modal({[m[41m[m
[32m+[m[32m  show = false,[m[41m[m
[32m+[m[32m  title,[m[41m[m
[32m+[m[32m  children,[m[41m[m
[32m+[m[32m  footer,[m[41m[m
[32m+[m[32m  onClose,[m[41m[m
[32m+[m[32m}: modalProps) {[m[41m[m
[32m+[m[32m  const [id, setId] = useState<string>();[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  useEffect(() => {[m[41m[m
[32m+[m[32m    setId(guuid());[m[41m[m
[32m+[m[32m  }, []);[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  function handleKey(e: KeyboardEvent) {[m[41m[m
[32m+[m[32m    if (e.keyCode == 27) {[m[41m[m
[32m+[m[32m      onClose();[m[41m[m
[32m+[m[32m    }[m[41m[m
[32m+[m[32m  }[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  useEffect(() => {[m[41m[m
[32m+[m[32m    document.addEventListener("keydown", handleKey);[m[41m[m
[32m+[m[32m    return () => document.removeEventListener("keydown", handleKey);[m[41m[m
[32m+[m[32m  }, []);[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  const dClass = useMemo(() => {[m[41m[m
[32m+[m[32m    return show ? { display: "flex" } : {};[m[41m[m
[32m+[m[32m  }, [show]);[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  return ([m[41m[m
[32m+[m[32m    <div[m[41m[m
[32m+[m[32m      className={`modal  fade${show ? " show" : ""}`}[m[41m[m
[32m+[m[32m      id={id}[m[41m[m
[32m+[m[32m      tabIndex={-1}[m[41m[m
[32m+[m[32m      data-bs-backdrop="static"[m[41m[m
[32m+[m[32m      data-bs-keyboard="false"[m[41m[m
[32m+[m[32m      role="dialog"[m[41m[m
[32m+[m[32m      aria-labelledby={id + "_title"}[m[41m[m
[32m+[m[32m      aria-hidden="true"[m[41m[m
[32m+[m[32m      style={{ ...dClass }}[m[41m[m
[32m+[m[32m    >[m[41m[m
[32m+[m[32m      <div[m[41m[m
[32m+[m[32m        className="modal-backdrop-custom bg-dark bg-opacity-50 vw-100 vh-100 position-fixed"[m[41m[m
[32m+[m[32m        onClick={onClose}[m[41m[m
[32m+[m[32m        role="button"[m[41m[m
[32m+[m[32m      />[m[41m[m
[32m+[m[32m      <div[m[41m[m
[32m+[m[32m        className="modal-dialog modal-xl modal-dialog-scrollable modal-dialog-centered modal-sm"[m[41m[m
[32m+[m[32m        role="document"[m[41m[m
[32m+[m[32m      >[m[41m[m
[32m+[m[32m        <div className="modal-content">[m[41m[m
[32m+[m[32m          <div className="modal-header">[m[41m[m
[32m+[m[32m            <h5 className="modal-title" id={id + "_title"}>[m[41m[m
[32m+[m[32m              {title}[m[41m[m
[32m+[m[32m            </h5>[m[41m[m
[32m+[m[32m            <button[m[41m[m
[32m+[m[32m              type="button"[m[41m[m
[32m+[m[32m              className="btn-close"[m[41m[m
[32m+[m[32m              data-bs-dismiss="modal"[m[41m[m
[32m+[m[32m              aria-label="Close"[m[41m[m
[32m+[m[32m              onClick={onClose}[m[41m[m
[32m+[m[32m            />[m[41m[m
[32m+[m[32m          </div>[m[41m[m
[32m+[m[32m          <div className="modal-body">{children}</div>[m[41m[m
[32m+[m[32m          {(footer && <div className="modal-footer">{footer}</div>) || null}[m[41m[m
[32m+[m[32m        </div>[m[41m[m
[32m+[m[32m      </div>[m[41m[m
[32m+[m[32m    </div>[m[41m[m
[32m+[m[32m  );[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/components/Nav/NavLink.tsx b/handvask_frontend/src/components/Nav/NavLink.tsx[m
[1mindex 1b1c533..81b5e72 100644[m
[1m--- a/handvask_frontend/src/components/Nav/NavLink.tsx[m
[1m+++ b/handvask_frontend/src/components/Nav/NavLink.tsx[m
[36m@@ -1,6 +1,6 @@[m
 import Link from "next/link";[m
 import { useRouter } from "next/router";[m
[31m-import { useEffect } from "react";[m
[32m+[m[32mimport React from "react";[m
 [m
 type NavLinkPropT = {[m
   children: React.ReactNode;[m
[1mdiff --git a/handvask_frontend/src/components/Nav/index.tsx b/handvask_frontend/src/components/Nav/index.tsx[m
[1mindex d0027f9..8b6ce90 100644[m
[1m--- a/handvask_frontend/src/components/Nav/index.tsx[m
[1m+++ b/handvask_frontend/src/components/Nav/index.tsx[m
[36m@@ -1,77 +1,77 @@[m
[31m-import NavLink from "./NavLink";[m
[31m-import useUser from "../../hooks/useUser";[m
[31m-import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";[m
[31m-import { faSink, faUser, faUserNinja } from "@fortawesome/free-solid-svg-icons";[m
[31m-[m
[31m-type NavPropT = {[m
[31m-  user: User;[m
[31m-};[m
[31m-[m
[31m-export default function Nav({ user }: NavPropT) {[m
[31m-  return ([m
[31m-    <nav[m
[31m-      className="navbar navbar-expand-lg navbar-light bg-light shadow-sm"[m
[31m-      style={{ zIndex: 99 }}[m
[31m-    >[m
[31m-      <div className="container-fluid">[m
[31m-        <NavLink className="navbar-brand" href="/">[m
[31m-          <FontAwesomeIcon icon={faSink} size={"lg"} />[m
[31m-        </NavLink>[m
[31m-        <button[m
[31m-          className="navbar-toggler"[m
[31m-          type="button"[m
[31m-          data-bs-toggle="collapse"[m
[31m-          data-bs-target="#mainNavbar"[m
[31m-          aria-controls="mainNavbar"[m
[31m-          aria-expanded="false"[m
[31m-          aria-label="Toggle navigation"[m
[31m-        >[m
[31m-          <span className="navbar-toggler-icon" />[m
[31m-        </button>[m
[31m-        <div className="collapse navbar-collapse" id="mainNavbar">[m
[31m-          <ul className="navbar-nav me-auto mb-2 mb-lg-0">[m
[31m-            <li className="nav-item">[m
[31m-              <NavLink className="nav-link" href="/">[m
[31m-                Home[m
[31m-              </NavLink>[m
[31m-            </li>[m
[31m-            <li className="nav-item">[m
[31m-              <NavLink className="nav-link" href="/handvask">[m
[31m-                Minizinc[m
[31m-              </NavLink>[m
[31m-            </li>[m
[31m-            <li className="nav-item">[m
[31m-              <NavLink className="nav-link" href="/admin">[m
[31m-                Admin[m
[31m-              </NavLink>[m
[31m-            </li>[m
[31m-          </ul>[m
[31m-          <ul className="navbar-nav ms-auto mb-2 mb-lg-0">[m
[31m-            <li className="nav-item dropdown" id="userDropdownMenu">[m
[31m-              <a[m
[31m-                className="nav-link dropdown-toggle"[m
[31m-                href="#"[m
[31m-                id="navbarDropdown"[m
[31m-                role="button"[m
[31m-                data-bs-toggle="dropdown"[m
[31m-                aria-expanded="false"[m
[31m-                onClick={(e) => e.preventDefault()}[m
[31m-              >[m
[31m-                <FontAwesomeIcon icon={user.sys_admin ? faUserNinja : faUser} />{" "}[m
[31m-                {user.username}[m
[31m-              </a>[m
[31m-              <ul[m
[31m-                className="dropdown-menu dropdown-menu-end"[m
[31m-                aria-labelledby="userDropdownMenu"[m
[31m-              >[m
[31m-                <NavLink className="dropdown-item" href="/logout">[m
[31m-                  Log out[m
[31m-                </NavLink>[m
[31m-              </ul>[m
[31m-            </li>[m
[31m-          </ul>[m
[31m-        </div>[m
[31m-      </div>[m
[31m-    </nav>[m
[31m-  );[m
[31m-}[m
[32m+[m[32mimport NavLink from "./NavLink";[m[41m[m
[32m+[m[32mimport { FontAwesomeIcon } from "@fortawesome/react-fontawesome";[m[41m[m
[32m+[m[32mimport { faSink, faUser, faUserNinja } from "@fortawesome/free-solid-svg-icons";[m[41m[m
[32m+[m[32mimport React from "react";[m[41m[m
[32m+[m[41m[m
[32m+[m[32mtype NavPropT = {[m[41m[m
[32m+[m[32m  user: User;[m[41m[m
[32m+[m[32m};[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexport default function Nav({ user }: NavPropT) {[m[41m[m
[32m+[m[32m  return ([m[41m[m
[32m+[m[32m    <nav[m[41m[m
[32m+[m[32m      className="navbar navbar-expand-lg navbar-light bg-light shadow-sm"[m[41m[m
[32m+[m[32m      style={{ zIndex: 99 }}[m[41m[m
[32m+[m[32m    >[m[41m[m
[32m+[m[32m      <div className="container-fluid">[m[41m[m
[32m+[m[32m        <NavLink className="navbar-brand" href="/">[m[41m[m
[32m+[m[32m          <FontAwesomeIcon icon={faSink} size={"lg"} />[m[41m[m
[32m+[m[32m        </NavLink>[m[41m[m
[32m+[m[32m        <button[m[41m[m
[32m+[m[32m          className="navbar-toggler"[m[41m[m
[32m+[m[32m          type="button"[m[41m[m
[32m+[m[32m          data-bs-toggle="collapse"[m[41m[m
[32m+[m[32m          data-bs-target="#mainNavbar"[m[41m[m
[32m+[m[32m          aria-controls="mainNavbar"[m[41m[m
[32m+[m[32m          aria-expanded="false"[m[41m[m
[32m+[m[32m          aria-label="Toggle navigation"[m[41m[m
[32m+[m[32m        >[m[41m[m
[32m+[m[32m          <span className="navbar-toggler-icon" />[m[41m[m
[32m+[m[32m        </button>[m[41m[m
[32m+[m[32m        <div className="collapse navbar-collapse" id="mainNavbar">[m[41m[m
[32m+[m[32m          <ul className="navbar-nav me-auto mb-2 mb-lg-0">[m[41m[m
[32m+[m[32m            <li className="nav-item">[m[41m[m
[32m+[m[32m              <NavLink className="nav-link" href="/">[m[41m[m
[32m+[m[32m                Home[m[41m[m
[32m+[m[32m              </NavLink>[m[41m[m
[32m+[m[32m            </li>[m[41m[m
[32m+[m[32m            <li className="nav-item">[m[41m[m
[32m+[m[32m              <NavLink className="nav-link" href="/handvask">[m[41m[m
[32m+[m[32m                Minizinc[m[41m[m
[32m+[m[32m              </NavLink>[m[41m[m
[32m+[m[32m            </li>[m[41m[m
[32m+[m[32m            <li className="nav-item">[m[41m[m
[32m+[m[32m              <NavLink className="nav-link" href="/admin">[m[41m[m
[32m+[m[32m                Admin[m[41m[m
[32m+[m[32m              </NavLink>[m[41m[m
[32m+[m[32m            </li>[m[41m[m
[32m+[m[32m          </ul>[m[41m[m
[32m+[m[32m          <ul className="navbar-nav ms-auto mb-2 mb-lg-0">[m[41m[m
[32m+[m[32m            <li className="nav-item dropdown" id="userDropdownMenu">[m[41m[m
[32m+[m[32m              <a[m[41m[m
[32m+[m[32m                className="nav-link dropdown-toggle"[m[41m[m
[32m+[m[32m                href="#"[m[41m[m
[32m+[m[32m                id="navbarDropdown"[m[41m[m
[32m+[m[32m                role="button"[m[41m[m
[32m+[m[32m                data-bs-toggle="dropdown"[m[41m[m
[32m+[m[32m                aria-expanded="false"[m[41m[m
[32m+[m[32m                onClick={(e) => e.preventDefault()}[m[41m[m
[32m+[m[32m              >[m[41m[m
[32m+[m[32m                <FontAwesomeIcon icon={user.sys_admin ? faUserNinja : faUser} />{" "}[m[41m[m
[32m+[m[32m                {user.username}[m[41m[m
[32m+[m[32m              </a>[m[41m[m
[32m+[m[32m              <ul[m[41m[m
[32m+[m[32m                className="dropdown-menu dropdown-menu-end"[m[41m[m
[32m+[m[32m                aria-labelledby="userDropdownMenu"[m[41m[m
[32m+[m[32m              >[m[41m[m
[32m+[m[32m                <NavLink className="dropdown-item" href="/logout">[m[41m[m
[32m+[m[32m                  Log out[m[41m[m
[32m+[m[32m                </NavLink>[m[41m[m
[32m+[m[32m              </ul>[m[41m[m
[32m+[m[32m            </li>[m[41m[m
[32m+[m[32m          </ul>[m[41m[m
[32m+[m[32m        </div>[m[41m[m
[32m+[m[32m      </div>[m[41m[m
[32m+[m[32m    </nav>[m[41m[m
[32m+[m[32m  );[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/components/PageLoader.tsx b/handvask_frontend/src/components/PageLoader.tsx[m
[1mindex a44d433..6b56726 100644[m
[1m--- a/handvask_frontend/src/components/PageLoader.tsx[m
[1m+++ b/handvask_frontend/src/components/PageLoader.tsx[m
[36m@@ -1,5 +1,6 @@[m
 import { faSpinner } from "@fortawesome/free-solid-svg-icons";[m
 import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";[m
[32m+[m[32mimport React from "react";[m
 [m
 export default function PageLoader() {[m
   return ([m
[1mdiff --git a/handvask_frontend/src/components/SideBarButton.tsx b/handvask_frontend/src/components/SideBarButton.tsx[m
[1mindex 50f082d..8d054a7 100644[m
[1m--- a/handvask_frontend/src/components/SideBarButton.tsx[m
[1m+++ b/handvask_frontend/src/components/SideBarButton.tsx[m
[36m@@ -1,22 +1,24 @@[m
[31m-type SideBarButtonPropT = {[m
[31m-  name: string;[m
[31m-  active: boolean;[m
[31m-  trigger: () => void;[m
[31m-};[m
[31m-export default function SideBarButton({[m
[31m-  name,[m
[31m-  active,[m
[31m-  trigger,[m
[31m-}: SideBarButtonPropT) {[m
[31m-  return ([m
[31m-    <div>[m
[31m-      <p[m
[31m-        className={`${active ? "" : "text-opacity-75"} text-dark`}[m
[31m-        style={{ cursor: "pointer" }}[m
[31m-        onClick={trigger}[m
[31m-      >[m
[31m-        {name}[m
[31m-      </p>[m
[31m-    </div>[m
[31m-  );[m
[31m-}[m
[32m+[m[32mimport React from "react";[m[41m[m
[32m+[m[41m[m
[32m+[m[32mtype SideBarButtonPropT = {[m[41m[m
[32m+[m[32m  name: string;[m[41m[m
[32m+[m[32m  active: boolean;[m[41m[m
[32m+[m[32m  trigger: () => void;[m[41m[m
[32m+[m[32m};[m[41m[m
[32m+[m[32mexport default function SideBarButton({[m[41m[m
[32m+[m[32m  name,[m[41m[m
[32m+[m[32m  active,[m[41m[m
[32m+[m[32m  trigger,[m[41m[m
[32m+[m[32m}: SideBarButtonPropT) {[m[41m[m
[32m+[m[32m  return ([m[41m[m
[32m+[m[32m    <div>[m[41m[m
[32m+[m[32m      <p[m[41m[m
[32m+[m[32m        className={`${active ? "" : "text-opacity-75"} text-dark`}[m[41m[m
[32m+[m[32m        style={{ cursor: "pointer" }}[m[41m[m
[32m+[m[32m        onClick={trigger}[m[41m[m
[32m+[m[32m      >[m[41m[m
[32m+[m[32m        {name}[m[41m[m
[32m+[m[32m      </p>[m[41m[m
[32m+[m[32m    </div>[m[41m[m
[32m+[m[32m  );[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/functions.ts b/handvask_frontend/src/functions.ts[m
[1mindex 62f04be..253204a 100644[m
[1m--- a/handvask_frontend/src/functions.ts[m
[1m+++ b/handvask_frontend/src/functions.ts[m
[36m@@ -25,7 +25,7 @@[m [mexport function objToUrlEncoded(obj: Record<string, unknown>) {[m
 }[m
 [m
 export function listToUrlEncoded(arr: (string | number)[], name: string) {[m
[31m-  return `${name}=` + arr.join(`${name}=`);[m
[32m+[m[32m  return `${name}=` + arr.join(`&${name}=`);[m
 }[m
 [m
 export function http<T = SuccessResponse>([m
[36m@@ -86,7 +86,7 @@[m [mexport function httpGet<T = SuccessResponse>([m
 [m
 export function httpPost<T = SuccessResponse>([m
   url: string,[m
[31m-  data: Record<string, unknown>,[m
[32m+[m[32m  data: Record<string, unknown> | string,[m
   callback?: (x: T) => void,[m
   useJson = true,[m
   headers: Record<string, string> = {}[m
[36m@@ -100,7 +100,11 @@[m [mexport function httpPost<T = SuccessResponse>([m
       "X-Requested-With": "XMLHttpRequest",[m
       ...headers,[m
     },[m
[31m-    body: useJson ? JSON.stringify(data) : objToUrlEncoded(data),[m
[32m+[m[32m    body: useJson[m
[32m+[m[32m      ? JSON.stringify(data)[m
[32m+[m[32m      : typeof data === "string"[m
[32m+[m[32m      ? data[m
[32m+[m[32m      : objToUrlEncoded(data),[m
   });[m
   http<T>(r, callback);[m
 }[m
[1mdiff --git a/handvask_frontend/src/hooks/useAPI.ts b/handvask_frontend/src/hooks/useAPI.ts[m
[1mindex 1256ac5..9ed3c2a 100644[m
[1m--- a/handvask_frontend/src/hooks/useAPI.ts[m
[1m+++ b/handvask_frontend/src/hooks/useAPI.ts[m
[36m@@ -28,7 +28,7 @@[m [mexport default function useAPI() {[m
 [m
   function post<T = SuccessResponse>([m
     url: string,[m
[31m-    data: Record<string, unknown>,[m
[32m+[m[32m    data: Record<string, unknown> | string,[m
     callback?: (x: T) => void,[m
     useJson = true,[m
     headers: Record<string, string> = {}[m
[1mdiff --git a/handvask_frontend/src/hooks/useUser.ts b/handvask_frontend/src/hooks/useUser.ts[m
[1mindex 987a08b..8a3da6b 100644[m
[1m--- a/handvask_frontend/src/hooks/useUser.ts[m
[1m+++ b/handvask_frontend/src/hooks/useUser.ts[m
[36m@@ -1,8 +1,13 @@[m
 import { getCookie, hasCookie, setCookie } from "cookies-next";[m
[31m-import { useEffect, useState } from "react";[m
[32m+[m[32mimport { useEffect, useMemo, useState } from "react";[m
 import useAPI from "./useAPI";[m
 import useToken from "./useToken";[m
 [m
[32m+[m[32mexport type ExpandedUser = {[m
[32m+[m[32m  addMzn: (id: number) => void;[m
[32m+[m[32m  addDzn: (id: number) => void;[m
[32m+[m[32m} & User;[m
[32m+[m
 export default function useUser() {[m
   const token = useToken();[m
   const [user, setUser] = useState<User>();[m
[36m@@ -10,6 +15,30 @@[m [mexport default function useUser() {[m
 [m
   const { get } = useAPI();[m
 [m
[32m+[m[32m  const expandedUser = useMemo<ExpandedUser>(() => {[m
[32m+[m[32m    return {[m
[32m+[m[32m      ...user,[m
[32m+[m[32m      addMzn(id) {[m
[32m+[m[32m        setUser((v) => {[m
[32m+[m[32m          if (!v) return v;[m
[32m+[m[32m          return {[m
[32m+[m[32m            ...v,[m
[32m+[m[32m            mzn_instances: [...v.mzn_instances.filter((i) => i != id), id],[m
[32m+[m[32m          };[m
[32m+[m[32m        });[m
[32m+[m[32m      },[m
[32m+[m[32m      addDzn(id) {[m
[32m+[m[32m        setUser((v) => {[m
[32m+[m[32m          if (!v) return v;[m
[32m+[m[32m          return {[m
[32m+[m[32m            ...v,[m
[32m+[m[32m            dzn_instances: [...v.dzn_instances.filter((i) => i != id), id],[m
[32m+[m[32m          };[m
[32m+[m[32m        });[m
[32m+[m[32m      },[m
[32m+[m[32m    } as ExpandedUser;[m
[32m+[m[32m  }, [user]);[m
[32m+[m
   useEffect(() => {[m
     let loaded = false;[m
     if (hasUserCookie) {[m
[36m@@ -32,5 +61,5 @@[m [mexport default function useUser() {[m
     }[m
   }, [token]);[m
 [m
[31m-  return user;[m
[32m+[m[32m  return expandedUser;[m
 }[m
[1mdiff --git a/handvask_frontend/src/index.d.ts b/handvask_frontend/src/index.d.ts[m
[1mindex c5d7620..4653283 100644[m
[1m--- a/handvask_frontend/src/index.d.ts[m
[1m+++ b/handvask_frontend/src/index.d.ts[m
[36m@@ -17,3 +17,10 @@[m [mtype MznInstance = {[m
   friendly_name: string;[m
   contents: string | null;[m
 };[m
[32m+[m
[32m+[m[32mtype DznInstance = {[m
[32m+[m[32m  id: number;[m
[32m+[m[32m  user: number;[m
[32m+[m[32m  friendly_name: string;[m
[32m+[m[32m  contents: string | null;[m
[32m+[m[32m};[m
[1mdiff --git a/handvask_frontend/src/pages/_app.tsx b/handvask_frontend/src/pages/_app.tsx[m
[1mindex 896af0e..2b5e665 100644[m
[1m--- a/handvask_frontend/src/pages/_app.tsx[m
[1m+++ b/handvask_frontend/src/pages/_app.tsx[m
[36m@@ -7,7 +7,7 @@[m [mimport "@fortawesome/fontawesome-svg-core/styles.css";[m
 import "../styles/globals.css";[m
 import type { AppProps } from "next/app";[m
 import Head from "next/head";[m
[31m-import { useEffect } from "react";[m
[32m+[m[32mimport React, { useEffect } from "react";[m
 [m
 export default function App({ Component, pageProps }: AppProps) {[m
   // Only load bootstrap js on client side[m
[36m@@ -18,10 +18,7 @@[m [mexport default function App({ Component, pageProps }: AppProps) {[m
   return ([m
     <>[m
       <Head>[m
[31m-        <meta[m
[31m-          name="viewport"[m
[31m-          content="width=device-width, initial-scale=1"[m
[31m-         />[m
[32m+[m[32m        <meta name="viewport" content="width=device-width, initial-scale=1" />[m
       </Head>[m
       <Component {...pageProps} />[m
     </>[m
[1mdiff --git a/handvask_frontend/src/pages/admin.tsx b/handvask_frontend/src/pages/admin.tsx[m
[1mindex 971a19b..12f4caa 100644[m
[1m--- a/handvask_frontend/src/pages/admin.tsx[m
[1m+++ b/handvask_frontend/src/pages/admin.tsx[m
[36m@@ -1,5 +1,5 @@[m
[31m-import React, { useEffect } from "react";[m
[31m-import Base from "../components/Base";[m
[31m-export default function admin() {[m
[31m-  return <Base>admin page</Base>;[m
[31m-}[m
[32m+[m[32mimport React from "react";[m[41m[m
[32m+[m[32mimport Base from "../components/Base";[m[41m[m
[32m+[m[32mexport default function admin() {[m[41m[m
[32m+[m[32m  return <Base>admin page</Base>;[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/pages/handvask.tsx b/handvask_frontend/src/pages/handvask.tsx[m
[1mindex 41ba7fb..f43eb5c 100644[m
[1m--- a/handvask_frontend/src/pages/handvask.tsx[m
[1m+++ b/handvask_frontend/src/pages/handvask.tsx[m
[36m@@ -1,5 +1,5 @@[m
[31m-import React from "react";[m
[31m-import Base from "../components/Base";[m
[31m-export default function Minizinc() {[m
[31m-  return <Base>Minizinc</Base>;[m
[31m-}[m
[32m+[m[32mimport React from "react";[m[41m[m
[32m+[m[32mimport Base from "../components/Base";[m[41m[m
[32m+[m[32mexport default function Minizinc() {[m[41m[m
[32m+[m[32m  return <Base>Minizinc</Base>;[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/pages/index.tsx b/handvask_frontend/src/pages/index.tsx[m
[1mindex 8f06bd7..f392359 100644[m
[1m--- a/handvask_frontend/src/pages/index.tsx[m
[1m+++ b/handvask_frontend/src/pages/index.tsx[m
[36m@@ -1,3 +1,3 @@[m
[31m-import Home from "../components/Home";[m
[31m-[m
[31m-export default Home;[m
[32m+[m[32mimport Home from "../components/Home";[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexport default Home;[m[41m[m
[1mdiff --git a/handvask_frontend/src/pages/login.tsx b/handvask_frontend/src/pages/login.tsx[m
[1mindex 3cfb424..3e05604 100644[m
[1m--- a/handvask_frontend/src/pages/login.tsx[m
[1m+++ b/handvask_frontend/src/pages/login.tsx[m
[36m@@ -1,108 +1,109 @@[m
[31m-import Head from "next/head";[m
[31m-import { useEffect, useState } from "react";[m
[31m-import { useRouter } from "next/router";[m
[31m-import { setCookie, hasCookie } from "cookies-next";[m
[31m-import useAPI from "../hooks/useAPI";[m
[31m-import AsyncBtn from "../components/AsyncBtn";[m
[31m-import Link from "next/link";[m
[31m-[m
[31m-export default function Login() {[m
[31m-  const [username, setUsername] = useState("");[m
[31m-  const [password, setPassword] = useState("");[m
[31m-  const [hadError, setHadError] = useState(false);[m
[31m-  const [hasToken, setHasToken] = useState(false);[m
[31m-  const [formLoading, setFormLoading] = useState(false);[m
[31m-  const router = useRouter();[m
[31m-[m
[31m-  const { post } = useAPI();[m
[31m-[m
[31m-  useEffect(() => {[m
[31m-    if (hasToken === true) {[m
[31m-      router.replace("/");[m
[31m-    }[m
[31m-  }, [hasToken]);[m
[31m-[m
[31m-  useEffect(() => {[m
[31m-    setHasToken(hasCookie("handvask_api_token"));[m
[31m-  }, []);[m
[31m-[m
[31m-  function handleLogin(e: React.FormEvent<HTMLFormElement>) {[m
[31m-    e.preventDefault();[m
[31m-    setFormLoading(true);[m
[31m-    post<{[m
[31m-      detail?: string;[m
[31m-      access_token?: string;[m
[31m-      token_type?: string;[m
[31m-      success?: boolean;[m
[31m-    }>([m
[31m-      "/auth/login",[m
[31m-      { username, password },[m
[31m-      (r) => {[m
[31m-        setFormLoading(false);[m
[31m-        if (r.detail) {[m
[31m-          setHadError(true);[m
[31m-        } else {[m
[31m-          setCookie("handvask_api_token", r.access_token, {[m
[31m-            maxAge: 86400,[m
[31m-          });[m
[31m-          router.replace("/");[m
[31m-        }[m
[31m-      },[m
[31m-      false[m
[31m-    );[m
[31m-    return false;[m
[31m-  }[m
[31m-  return ([m
[31m-    <>[m
[31m-      <Head>[m
[31m-        <title>Handvask login page</title>[m
[31m-        <link rel="icon" href="/favicon.ico" />[m
[31m-      </Head>[m
[31m-      <div className="vw-100 vh-100 d-flex flex-column justify-content-around align-items-center bg-light px-5">[m
[31m-        <h1 className="display-1 fw-bold">HANDVASK</h1>[m
[31m-        <div className="vw-100 d-flex justify-content-center align-items-center bg-light px-5">[m
[31m-          <div className="card shadow">[m
[31m-            <form onSubmit={handleLogin}>[m
[31m-              <div className="card-body d-flex flex-column align-items-center">[m
[31m-                <div className="form-floating mb-3 w-100">[m
[31m-                  <input[m
[31m-                    type="text"[m
[31m-                    className={`form-control ${hadError ? "is-invalid" : ""}`}[m
[31m-                    id="userInput"[m
[31m-                    value={username}[m
[31m-                    placeholder=" "[m
[31m-                    onChange={(e) => setUsername(e.target.value)}[m
[31m-                  />[m
[31m-                  <label htmlFor="passwordInput">Username</label>[m
[31m-                </div>[m
[31m-                <div className="form-floating mb-3 w-100">[m
[31m-                  <input[m
[31m-                    type="password"[m
[31m-                    className={`form-control ${hadError ? "is-invalid" : ""}`}[m
[31m-                    id="passwordInput"[m
[31m-                    value={password}[m
[31m-                    placeholder=" "[m
[31m-                    onChange={(e) => setPassword(e.target.value)}[m
[31m-                  />[m
[31m-                  <label htmlFor="passwordInput">Password</label>[m
[31m-                </div>[m
[31m-                <AsyncBtn[m
[31m-                  type="submit"[m
[31m-                  loading={formLoading}[m
[31m-                  kind="primary"[m
[31m-                  className="w-100"[m
[31m-                >[m
[31m-                  Login[m
[31m-                </AsyncBtn>[m
[31m-                <Link href="/register" className="mt-2">[m
[31m-                  I don't have an account yet man[m
[31m-                </Link>[m
[31m-              </div>[m
[31m-            </form>[m
[31m-          </div>[m
[31m-        </div>[m
[31m-        <div />[m
[31m-      </div>[m
[31m-    </>[m
[31m-  );[m
[31m-}[m
[32m+[m[32mimport Head from "next/head";[m[41m[m
[32m+[m[32mimport { useEffect, useState } from "react";[m[41m[m
[32m+[m[32mimport { useRouter } from "next/router";[m[41m[m
[32m+[m[32mimport { setCookie, hasCookie } from "cookies-next";[m[41m[m
[32m+[m[32mimport useAPI from "../hooks/useAPI";[m[41m[m
[32m+[m[32mimport AsyncBtn from "../components/AsyncBtn";[m[41m[m
[32m+[m[32mimport Link from "next/link";[m[41m[m
[32m+[m[32mimport React from "react";[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexport default function Login() {[m[41m[m
[32m+[m[32m  const [username, setUsername] = useState("");[m[41m[m
[32m+[m[32m  const [password, setPassword] = useState("");[m[41m[m
[32m+[m[32m  const [hadError, setHadError] = useState(false);[m[41m[m
[32m+[m[32m  const [hasToken, setHasToken] = useState(false);[m[41m[m
[32m+[m[32m  const [formLoading, setFormLoading] = useState(false);[m[41m[m
[32m+[m[32m  const router = useRouter();[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  const { post } = useAPI();[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  useEffect(() => {[m[41m[m
[32m+[m[32m    if (hasToken === true) {[m[41m[m
[32m+[m[32m      router.replace("/");[m[41m[m
[32m+[m[32m    }[m[41m[m
[32m+[m[32m  }, [hasToken]);[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  useEffect(() => {[m[41m[m
[32m+[m[32m    setHasToken(hasCookie("handvask_api_token"));[m[41m[m
[32m+[m[32m  }, []);[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  function handleLogin(e: React.FormEvent<HTMLFormElement>) {[m[41m[m
[32m+[m[32m    e.preventDefault();[m[41m[m
[32m+[m[32m    setFormLoading(true);[m[41m[m
[32m+[m[32m    post<{[m[41m[m
[32m+[m[32m      detail?: string;[m[41m[m
[32m+[m[32m      access_token?: string;[m[41m[m
[32m+[m[32m      token_type?: string;[m[41m[m
[32m+[m[32m      success?: boolean;[m[41m[m
[32m+[m[32m    }>([m[41m[m
[32m+[m[32m      "/auth/login",[m[41m[m
[32m+[m[32m      { username, password },[m[41m[m
[32m+[m[32m      (r) => {[m[41m[m
[32m+[m[32m        setFormLoading(false);[m[41m[m
[32m+[m[32m        if (r.detail) {[m[41m[m
[32m+[m[32m          setHadError(true);[m[41m[m
[32m+[m[32m        } else {[m[41m[m
[32m+[m[32m          setCookie("handvask_api_token", r.access_token, {[m[41m[m
[32m+[m[32m            maxAge: 86400,[m[41m[m
[32m+[m[32m          });[m[41m[m
[32m+[m[32m          router.replace("/");[m[41m[m
[32m+[m[32m        }[m[41m[m
[32m+[m[32m      },[m[41m[m
[32m+[m[32m      false[m[41m[m
[32m+[m[32m    );[m[41m[m
[32m+[m[32m    return false;[m[41m[m
[32m+[m[32m  }[m[41m[m
[32m+[m[32m  return ([m[41m[m
[32m+[m[32m    <>[m[41m[m
[32m+[m[32m      <Head>[m[41m[m
[32m+[m[32m        <title>Handvask login page</title>[m[41m[m
[32m+[m[32m        <link rel="icon" href="/favicon.ico" />[m[41m[m
[32m+[m[32m      </Head>[m[41m[m
[32m+[m[32m      <div className="vw-100 vh-100 d-flex flex-column justify-content-around align-items-center bg-light px-5">[m[41m[m
[32m+[m[32m        <h1 className="display-1 fw-bold">HANDVASK</h1>[m[41m[m
[32m+[m[32m        <div className="vw-100 d-flex justify-content-center align-items-center bg-light px-5">[m[41m[m
[32m+[m[32m          <div className="card shadow">[m[41m[m
[32m+[m[32m            <form onSubmit={handleLogin}>[m[41m[m
[32m+[m[32m              <div className="card-body d-flex flex-column align-items-center">[m[41m[m
[32m+[m[32m                <div className="form-floating mb-3 w-100">[m[41m[m
[32m+[m[32m                  <input[m[41m[m
[32m+[m[32m                    type="text"[m[41m[m
[32m+[m[32m                    className={`form-control ${hadError ? "is-invalid" : ""}`}[m[41m[m
[32m+[m[32m                    id="userInput"[m[41m[m
[32m+[m[32m                    value={username}[m[41m[m
[32m+[m[32m                    placeholder=" "[m[41m[m
[32m+[m[32m                    onChange={(e) => setUsername(e.target.value)}[m[41m[m
[32m+[m[32m                  />[m[41m[m
[32m+[m[32m                  <label htmlFor="passwordInput">Username</label>[m[41m[m
[32m+[m[32m                </div>[m[41m[m
[32m+[m[32m                <div className="form-floating mb-3 w-100">[m[41m[m
[32m+[m[32m                  <input[m[41m[m
[32m+[m[32m                    type="password"[m[41m[m
[32m+[m[32m                    className={`form-control ${hadError ? "is-invalid" : ""}`}[m[41m[m
[32m+[m[32m                    id="passwordInput"[m[41m[m
[32m+[m[32m                    value={password}[m[41m[m
[32m+[m[32m                    placeholder=" "[m[41m[m
[32m+[m[32m                    onChange={(e) => setPassword(e.target.value)}[m[41m[m
[32m+[m[32m                  />[m[41m[m
[32m+[m[32m                  <label htmlFor="passwordInput">Password</label>[m[41m[m
[32m+[m[32m                </div>[m[41m[m
[32m+[m[32m                <AsyncBtn[m[41m[m
[32m+[m[32m                  type="submit"[m[41m[m
[32m+[m[32m                  loading={formLoading}[m[41m[m
[32m+[m[32m                  kind="primary"[m[41m[m
[32m+[m[32m                  className="w-100"[m[41m[m
[32m+[m[32m                >[m[41m[m
[32m+[m[32m                  Login[m[41m[m
[32m+[m[32m                </AsyncBtn>[m[41m[m
[32m+[m[32m                <Link href="/register" className="mt-2">[m[41m[m
[32m+[m[32m                  I don't have an account yet man[m[41m[m
[32m+[m[32m                </Link>[m[41m[m
[32m+[m[32m              </div>[m[41m[m
[32m+[m[32m            </form>[m[41m[m
[32m+[m[32m          </div>[m[41m[m
[32m+[m[32m        </div>[m[41m[m
[32m+[m[32m        <div />[m[41m[m
[32m+[m[32m      </div>[m[41m[m
[32m+[m[32m    </>[m[41m[m
[32m+[m[32m  );[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/pages/logout.tsx b/handvask_frontend/src/pages/logout.tsx[m
[1mindex ab8a28f..df081f2 100644[m
[1m--- a/handvask_frontend/src/pages/logout.tsx[m
[1m+++ b/handvask_frontend/src/pages/logout.tsx[m
[36m@@ -1,14 +1,14 @@[m
[31m-import { deleteCookie } from "cookies-next";[m
[31m-import { useRouter } from "next/router";[m
[31m-import { useEffect } from "react";[m
[31m-[m
[31m-export default function Logout() {[m
[31m-  deleteCookie("handvask_api_token");[m
[31m-  deleteCookie("handvask_tmp_user");[m
[31m-  const router = useRouter();[m
[31m-[m
[31m-  useEffect(() => {[m
[31m-    router.replace("/login");[m
[31m-  }, []);[m
[31m-  return "";[m
[31m-}[m
[32m+[m[32mimport { deleteCookie } from "cookies-next";[m[41m[m
[32m+[m[32mimport { useRouter } from "next/router";[m[41m[m
[32m+[m[32mimport { useEffect } from "react";[m[41m[m
[32m+[m[41m[m
[32m+[m[32mexport default function Logout() {[m[41m[m
[32m+[m[32m  deleteCookie("handvask_api_token");[m[41m[m
[32m+[m[32m  deleteCookie("handvask_tmp_user");[m[41m[m
[32m+[m[32m  const router = useRouter();[m[41m[m
[32m+[m[41m[m
[32m+[m[32m  useEffect(() => {[m[41m[m
[32m+[m[32m    router.replace("/login");[m[41m[m
[32m+[m[32m  }, []);[m[41m[m
[32m+[m[32m  return "";[m[41m[m
[32m+[m[32m}[m[41m[m
[1mdiff --git a/handvask_frontend/src/pages/register.tsx b/handvask_frontend/src/pages/register.tsx[m
[1mindex fa1857a..69ab2f6 100644[m
[1m--- a/handvask_frontend/src/pages/register.tsx[m
[1m+++ b/handvask_frontend/src/pages/register.tsx[m
[36m@@ -1,10 +1,11 @@[m
 import Head from "next/head";[m
 import { useEffect, useState } from "react";[m
 import { useRouter } from "next/router";[m
[31m-import { setCookie, hasCookie } from "cookies-next";[m
[32m+[m[32mimport { hasCookie } from "cookies-next";[m
 import useAPI from "../hooks/useAPI";[m
 import AsyncBtn from "../components/AsyncBtn";[m
 import Link from "next/link";[m
[32m+[m[32mimport React from "react";[m
 [m
 export default function Register() {[m
   const [username, setUsername] = useState("");[m
[36m@@ -64,9 +65,8 @@[m [mexport default function Register() {[m
                 <div className="form-floating mb-3 w-100">[m
                   <input[m
                     type="text"[m
[31m-                    className={`form-control ${[m
[31m-                      hadUsernameError ? "is-invalid" : ""[m
[31m-                    }`}[m
[32m+[m[32m                    className={`form-control ${hadUsernameError ? "is-invalid" : ""[m
[32m+[m[32m                      }`}[m
                     id="userInput"[m
                     value={username}[m
                     placeholder=" "[m
[36m@@ -80,9 +80,8 @@[m [mexport default function Register() {[m
                 <div className="form-floating mb-3 w-100">[m
                   <input[m
                     type="password"[m
[31m-                    className={`form-control ${[m
[31m-                      hasPasswordError ? "is-invalid" : ""[m
[31m-                    }`}[m
[32m+[m[32m                    className={`form-control ${hasPasswordError ? "is-invalid" : ""[m
[32m+[m[32m                      }`}[m
                     id="passwordInput"[m
                     value={password}[m
                     placeholder=" "[m
[36m@@ -97,9 +96,8 @@[m [mexport default function Register() {[m
                 <div className="form-floating mb-3 w-100">[m
                   <input[m
                     type="password"[m
[31m-                    className={`form-control ${[m
[31m-                      hasPasswordError ? "is-invalid" : ""[m
[31m-                    }`}[m
[32m+[m[32m                    className={`form-control ${hasPasswordError ? "is-invalid" : ""[m
[32m+[m[32m                      }`}[m
                     id="confirmPasswordInput"[m
                     value={confirmPassword}[m
                     placeholder=" "[m
[1mdiff --git a/minizinc/Dockerfile b/minizinc/Dockerfile[m
[1mindex e3891e0..7483857 100644[m
[1m--- a/minizinc/Dockerfile[m
[1m+++ b/minizinc/Dockerfile[m
[36m@@ -1,21 +1,21 @@[m
[31m-FROM python[m
[31m-[m
[31m-RUN apt-get update -y[m
[31m-[m
[31m-RUN apt-get install -y minizinc[m
[31m-[m
[31m-RUN mkdir /app[m
[31m-[m
[31m-WORKDIR /app[m
[31m-[m
[31m-COPY requirements.txt /app[m
[31m-[m
[31m-RUN pip install --upgrade pip[m
[31m-[m
[31m-RUN pip install -r requirements.txt[m
[31m-[m
[31m-COPY main.py /app[m
[31m-[m
[31m-EXPOSE 5000[m
[31m-[m
[32m+[m[32mFROM python[m[41m[m
[32m+[m[41m[m
[32m+[m[32mRUN apt-get update -y[m[41m[m
[32m+[m[41m[m
[32m+[m[32mRUN apt-get install -y minizinc[m[41m[m
[32m+[m[41m[m
[32m+[m[32mRUN mkdir /app[m[41m[m
[32m+[m[41m[m
[32m+[m[32mWORKDIR /app[m[41m[m
[32m+[m[41m[m
[32m+[m[32mCOPY requirements.txt /app[m[41m[m
[32m+[m[41m[m
[32m+[m[32mRUN pip install --upgrade pip[m[41m[m
[32m+[m[41m[m
[32m+[m[32mRUN pip install -r requirements.txt[m[41m[m
[32m+[m[41m[m
[32m+[m[32mCOPY main.py /app[m[41m[m
[32m+[m[41m[m
[32m+[m[32mEXPOSE 5000[m[41m[m
[32m+[m[41m[m
 CMD ["python", "main.py"][m
\ No newline at end of file[m
[1mdiff --git a/minizinc/requirements.txt b/minizinc/requirements.txt[m
[1mindex d5658ec..a220642 100644[m
[1m--- a/minizinc/requirements.txt[m
[1m+++ b/minizinc/requirements.txt[m
[36m@@ -1,2 +1,2 @@[m
[31m-minizinc[m
[32m+[m[32mminizinc[m[41m[m
 flask[m
\ No newline at end of file[m
[1mdiff --git a/python_backend/.env.example b/python_backend/.env.example[m
[1mindex 19122c8..3a8a5a9 100644[m
[1m--- a/python_backend/.env.example[m
[1m+++ b/python_backend/.env.example[m
[36m@@ -1,5 +1,5 @@[m
[31m-export DB_HOST="127.0.0.1"[m
[31m-export DB_USER="username"[m
[31m-export DB_PASS="password"[m
[31m-export DB_NAME="database"[m
[32m+[m[32mexport DB_HOST="127.0.0.1"[m[41m[m
[32m+[m[32mexport DB_USER="username"[m[41m[m
[32m+[m[32mexport DB_PASS="password"[m[41m[m
[32m+[m[32mexport DB_NAME="database"[m[41m[m
 export HANDVASK_FRONTEND_ORIGIN="*"[m
\ No newline at end of file[m
[1mdiff --git a/python_backend/.gitignore b/python_backend/.gitignore[m
[1mindex b39c468..ee4fdfd 100644[m
[1m--- a/python_backend/.gitignore[m
[1m+++ b/python_backend/.gitignore[m
[36m@@ -1,3 +1,3 @@[m
[31m-__pycache__/[m
[31m-.env[m
[32m+[m[32m__pycache__/[m[41m[m
[32m+[m[32m.env[m[41m[m
 jwtRS256*[m
\ No newline at end of file[m
[1mdiff --git a/python_backend/app/Models.py b/python_backend/app/Models.py[m
[1mindex eb343fc..3e2f017 100644[m
[1m--- a/python_backend/app/Models.py[m
[1m+++ b/python_backend/app/Models.py[m
[36m@@ -1,141 +1,141 @@[m
[31m-from datetime import datetime[m
[31m-from os import getenv[m
[31m-from typing import Optional as OptionalT[m
[31m-[m
[31m-from pony.orm import *[m
[31m-from pydantic import BaseModel[m
[31m-[m
[31m-db = Database()[m
[31m-[m
[31m-[m
[31m-class User(db.Entity):[m
[31m-    id = PrimaryKey(int, auto=True)[m
[31m-    username = Required(str)[m
[31m-    password = Required(str)[m
[31m-    dzn_instances = Set("Dzn_instance")[m
[31m-    mzn_instances = Set("Mzn_instance")[m
[31m-    runs = Set("Run")[m
[31m-    sys_admin = Optional("Sys_admin")[m
[31m-    max_cpu = Required(int, default=6, unsigned=True)[m
[31m-[m
[31m-    def to_dict([m
[31m-        self,[m
[31m-        only=None,[m
[31m-        exclude=None,[m
[31m-        with_collections=False,[m
[31m-        with_lazy=False,[m
[31m-        related_objects=False,[m
[31m-    ):[m
[31m-        exclude = (exclude if exclude else []) + ["password"][m
[31m-        return super().to_dict([m
[31m-            only, exclude, with_collections, with_lazy, related_objects[m
[31m-        )[m
[31m-[m
[31m-[m
[31m-class UserT(BaseModel):[m
[31m-    id: int[m
[31m-    username: str[m
[31m-    dzn_instances: list[int][m
[31m-    mzn_instances: list[int][m
[31m-    runs: list[int][m
[31m-    sys_admin: OptionalT[int][m
[31m-    max_cpu: int[m
[31m-[m
[31m-[m
[31m-class Mzn_instance(db.Entity):[m
[31m-    id = PrimaryKey(int, auto=True)[m
[31m-    user = Required(User)[m
[31m-    friendly_name = Optional(str)[m
[31m-    runs = Set("Run")[m
[31m-    contents = Optional(LongStr)[m
[31m-[m
[31m-[m
[31m-class Mzn_instanceT(BaseModel):[m
[31m-    id: int[m
[31m-    user: int[m
[31m-    friendly_name: str[m
[31m-    runs: list[int][m
[31m-    contents: None | str[m
[31m-[m
[31m-[m
[31m-class Dzn_instance(db.Entity):[m
[31m-    id = PrimaryKey(int, auto=True)[m
[31m-    user = Required(User)[m
[31m-    friendly_name = Optional(str)[m
[31m-    runs = Set("Run")[m
[31m-    contents = Optional(LongStr)[m
[31m-[m
[31m-[m
[31m-class Dzn_instanceT(BaseModel):[m
[31m-    id: int[m
[31m-    user: int[m
[31m-    friendly_name: str[m
[31m-    runs: list[int][m
[31m-    contents: None | str[m
[31m-[m
[31m-[m
[31m-class Run(db.Entity):[m
[31m-    id = PrimaryKey(int, auto=True)[m
[31m-    user = Required(User)[m
[31m-    start_time = Required(datetime, default=lambda: datetime.now())[m
[31m-    end_time = Optional(datetime)[m
[31m-    result = Optional(str, nullable=True)[m
[31m-    solvers = Set("Solver")[m
[31m-    mzn_instance = Required(Mzn_instance)[m
[31m-    dzn_instance = Optional(Dzn_instance)[m
[31m-[m
[31m-[m
[31m-class RunT(BaseModel):[m
[31m-    id: int[m
[31m-    user: "UserT"[m
[31m-    start_time: datetime[m
[31m-    end_time: OptionalT[datetime][m
[31m-    result: OptionalT[str][m
[31m-    solvers: list[int][m
[31m-    mzn_instance: "Mzn_instanceT"[m
[31m-    dzn_instance: "Dzn_instanceT"[m
[31m-[m
[31m-[m
[31m-class Sys_admin(db.Entity):[m
[31m-    id = PrimaryKey(int, auto=True)[m
[31m-    user = Required(User)[m
[31m-[m
[31m-[m
[31m-class Sys_AdminT(BaseModel):[m
[31m-    id: int[m
[31m-    user: "UserT"[m
[31m-[m
[31m-[m
[31m-class Solver(db.Entity):[m
[31m-    id = PrimaryKey(int, auto=True)[m
[31m-    name = Optional(str)[m
[31m-    runs = Set(Run)[m
[31m-[m
[31m-[m
[31m-class SolverT(BaseModel):[m
[31m-    id: int[m
[31m-    name: OptionalT[str][m
[31m-    runs: list[int][m
[31m-[m
[31m-[m
[31m-class SuccessT(BaseModel):[m
[31m-    success: bool[m
[31m-[m
[31m-[m
[31m-UserT.update_forward_refs()[m
[31m-Mzn_instanceT.update_forward_refs()[m
[31m-Dzn_instanceT.update_forward_refs()[m
[31m-Sys_AdminT.update_forward_refs()[m
[31m-RunT.update_forward_refs()[m
[31m-SolverT.update_forward_refs()[m
[31m-[m
[31m-[m
[31m-def make_conn():[m
[31m-    db.bind([m
[31m-        provider="mysql",[m
[31m-        host=getenv("DB_HOST"),[m
[31m-        user=getenv("DB_USER"),[m
[31m-        passwd=getenv("DB_PASS"),[m
[31m-        database=getenv("DB_NAME"),[m
[31m-    )[m
[31m-    db.generate_mapping(create_tables=True)[m
[32m+[m[32mfrom datetime import datetime[m[41m[m
[32m+[m[32mfrom os import getenv[m[41m[m
[32m+[m[32mfrom typing import Optional as OptionalT[m[41m[m
[32m+[m[41m[m
[32m+[m[32mfrom pony.orm import Database, LongStr, Optional, PrimaryKey, Required, Set[m[41m[m
[32m+[m[32mfrom pydantic import BaseModel[m[41m[m
[32m+[m[41m[m
[32m+[m[32mdb = Database()[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass User(db.Entity):[m[41m[m
[32m+[m[32m    id = PrimaryKey(int, auto=True)[m[41m[m
[32m+[m[32m    username = Required(str)[m[41m[m
[32m+[m[32m    password = Required(str)[m[41m[m
[32m+[m[32m    dzn_instances = Set("Dzn_instance")[m[41m[m
[32m+[m[32m    mzn_instances = Set("Mzn_instance")[m[41m[m
[32m+[m[32m    runs = Set("Run")[m[41m[m
[32m+[m[32m    sys_admin = Optional("Sys_admin")[m[41m[m
[32m+[m[32m    max_cpu = Required(int, default=6, unsigned=True)[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    def to_dict([m[41m[m
[32m+[m[32m        self,[m[41m[m
[32m+[m[32m        only=None,[m[41m[m
[32m+[m[32m        exclude=None,[m[41m[m
[32m+[m[32m        with_collections=False,[m[41m[m
[32m+[m[32m        with_lazy=False,[m[41m[m
[32m+[m[32m        related_objects=False,[m[41m[m
[32m+[m[32m    ):[m[41m[m
[32m+[m[32m        exclude = (exclude if exclude else []) + ["password"][m[41m[m
[32m+[m[32m        return super().to_dict([m[41m[m
[32m+[m[32m            only, exclude, with_collections, with_lazy, related_objects[m[41m[m
[32m+[m[32m        )[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass UserT(BaseModel):[m[41m[m
[32m+[m[32m    id: int[m[41m[m
[32m+[m[32m    username: str[m[41m[m
[32m+[m[32m    dzn_instances: list[int][m[41m[m
[32m+[m[32m    mzn_instances: list[int][m[41m[m
[32m+[m[32m    runs: list[int][m[41m[m
[32m+[m[32m    sys_admin: OptionalT[int][m[41m[m
[32m+[m[32m    max_cpu: int[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass Mzn_instance(db.Entity):[m[41m[m
[32m+[m[32m    id = PrimaryKey(int, auto=True)[m[41m[m
[32m+[m[32m    user = Required(User)[m[41m[m
[32m+[m[32m    friendly_name = Optional(str)[m[41m[m
[32m+[m[32m    runs = Set("Run")[m[41m[m
[32m+[m[32m    contents = Optional(LongStr)[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass Mzn_instanceT(BaseModel):[m[41m[m
[32m+[m[32m    id: int[m[41m[m
[32m+[m[32m    user: int[m[41m[m
[32m+[m[32m    friendly_name: str[m[41m[m
[32m+[m[32m    runs: list[int][m[41m[m
[32m+[m[32m    contents: None | str[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass Dzn_instance(db.Entity):[m[41m[m
[32m+[m[32m    id = PrimaryKey(int, auto=True)[m[41m[m
[32m+[m[32m    user = Required(User)[m[41m[m
[32m+[m[32m    friendly_name = Optional(str)[m[41m[m
[32m+[m[32m    runs = Set("Run")[m[41m[m
[32m+[m[32m    contents = Optional(LongStr)[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass Dzn_instanceT(BaseModel):[m[41m[m
[32m+[m[32m    id: int[m[41m[m
[32m+[m[32m    user: int[m[41m[m
[32m+[m[32m    friendly_name: str[m[41m[m
[32m+[m[32m    runs: list[int][m[41m[m
[32m+[m[32m    contents: None | str[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass Run(db.Entity):[m[41m[m
[32m+[m[32m    id = PrimaryKey(int, auto=True)[m[41m[m
[32m+[m[32m    user = Required(User)[m[41m[m
[32m+[m[32m    start_time = Required(datetime, default=lambda: datetime.now())[m[41m[m
[32m+[m[32m    end_time = Optional(datetime)[m[41m[m
[32m+[m[32m    result = Optional(str, nullable=True)[m[41m[m
[32m+[m[32m    solvers = Set("Solver")[m[41m[m
[32m+[m[32m    mzn_instance = Required(Mzn_instance)[m[41m[m
[32m+[m[32m    dzn_instance = Optional(Dzn_instance)[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass RunT(BaseModel):[m[41m[m
[32m+[m[32m    id: int[m[41m[m
[32m+[m[32m    user: "UserT"[m[41m[m
[32m+[m[32m    start_time: datetime[m[41m[m
[32m+[m[32m    end_time: OptionalT[datetime][m[41m[m
[32m+[m[32m    result: OptionalT[str][m[41m[m
[32m+[m[32m    solvers: list[int][m[41m[m
[32m+[m[32m    mzn_instance: "Mzn_instanceT"[m[41m[m
[32m+[m[32m    dzn_instance: "Dzn_instanceT"[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass Sys_admin(db.Entity):[m[41m[m
[32m+[m[32m    id = PrimaryKey(int, auto=True)[m[41m[m
[32m+[m[32m    user = Required(User)[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass Sys_AdminT(BaseModel):[m[41m[m
[32m+[m[32m    id: int[m[41m[m
[32m+[m[32m    user: "UserT"[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass Solver(db.Entity):[m[41m[m
[32m+[m[32m    id = PrimaryKey(int, auto=True)[m[41m[m
[32m+[m[32m    name = Optional(str)[m[41m[m
[32m+[m[32m    runs = Set(Run)[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass SolverT(BaseModel):[m[41m[m
[32m+[m[32m    id: int[m[41m[m
[32m+[m[32m    name: OptionalT[str][m[41m[m
[32m+[m[32m    runs: list[int][m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass SuccessT(BaseModel):[m[41m[m
[32m+[m[32m    success: bool[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mUserT.update_forward_refs()[m[41m[m
[32m+[m[32mMzn_instanceT.update_forward_refs()[m[41m[m
[32m+[m[32mDzn_instanceT.update_forward_refs()[m[41m[m
[32m+[m[32mSys_AdminT.update_forward_refs()[m[41m[m
[32m+[m[32mRunT.update_forward_refs()[m[41m[m
[32m+[m[32mSolverT.update_forward_refs()[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mdef make_conn():[m[41m[m
[32m+[m[32m    db.bind([m[41m[m
[32m+[m[32m        provider="mysql",[m[41m[m
[32m+[m[32m        host=getenv("DB_HOST"),[m[41m[m
[32m+[m[32m        user=getenv("DB_USER"),[m[41m[m
[32m+[m[32m        passwd=getenv("DB_PASS"),[m[41m[m
[32m+[m[32m        database=getenv("DB_NAME"),[m[41m[m
[32m+[m[32m    )[m[41m[m
[32m+[m[32m    db.generate_mapping(create_tables=True)[m[41m[m
[1mdiff --git a/python_backend/app/middleware/auth.py b/python_backend/app/middleware/auth.py[m
[1mindex 3c57fad..9ee94b4 100644[m
[1m--- a/python_backend/app/middleware/auth.py[m
[1m+++ b/python_backend/app/middleware/auth.py[m
[36m@@ -1,25 +1,25 @@[m
[31m-from os.path import dirname[m
[31m-[m
[31m-import jwt[m
[31m-from fastapi import Depends, HTTPException[m
[31m-[m
[31m-from ..routes.auth import oauth2_scheme[m
[31m-[m
[31m-with open(f"{dirname(__file__)}/../../jwtRS256.key.pub", "r") as f:[m
[31m-    public_key = f.read()[m
[31m-[m
[31m-[m
[31m-def get_bearer_token(token: str = Depends(oauth2_scheme)):[m
[31m-    try:[m
[31m-        unencoded = jwt.decode(token, public_key, algorithms=["RS256"])[m
[31m-    except jwt.exceptions.ExpiredSignatureError:[m
[31m-        raise HTTPException([m
[31m-            status_code=401,[m
[31m-            detail="Token expired",[m
[31m-            headers={"WWW-Authenticate": "Bearer"},[m
[31m-        )[m
[31m-    return unencoded[m
[31m-[m
[31m-[m
[31m-def get_current_user_id(unencoded_token: dict = Depends(get_bearer_token)):[m
[31m-    return unencoded_token["user_id"][m
[32m+[m[32mfrom os.path import dirname[m[41m[m
[32m+[m[41m[m
[32m+[m[32mimport jwt[m[41m[m
[32m+[m[32mfrom fastapi import Depends, HTTPException[m[41m[m
[32m+[m[41m[m
[32m+[m[32mfrom ..routes.auth import oauth2_scheme[m[41m[m
[32m+[m[41m[m
[32m+[m[32mwith open(f"{dirname(__file__)}/../../jwtRS256.key.pub", "r") as f:[m[41m[m
[32m+[m[32m    public_key = f.read()[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mdef get_bearer_token(token: str = Depends(oauth2_scheme)):[m[41m[m
[32m+[m[32m    try:[m[41m[m
[32m+[m[32m        unencoded = jwt.decode(token, public_key, algorithms=["RS256"])[m[41m[m
[32m+[m[32m    except jwt.exceptions.ExpiredSignatureError:[m[41m[m
[32m+[m[32m        raise HTTPException([m[41m[m
[32m+[m[32m            status_code=401,[m[41m[m
[32m+[m[32m            detail="Token expired",[m[41m[m
[32m+[m[32m            headers={"WWW-Authenticate": "Bearer"},[m[41m[m
[32m+[m[32m        )[m[41m[m
[32m+[m[32m    return unencoded[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mdef get_current_user_id(unencoded_token: dict = Depends(get_bearer_token)):[m[41m[m
[32m+[m[32m    return unencoded_token["user_id"][m[41m[m
[1mdiff --git a/python_backend/app/routes/auth.py b/python_backend/app/routes/auth.py[m
[1mindex ee63fb3..22e9d7c 100644[m
[1m--- a/python_backend/app/routes/auth.py[m
[1m+++ b/python_backend/app/routes/auth.py[m
[36m@@ -1,87 +1,107 @@[m
[31m-from datetime import datetime[m
[31m-from os.path import dirname[m
[31m-[m
[31m-import jwt[m
[31m-from bcrypt import checkpw, gensalt, hashpw[m
[31m-from fastapi import APIRouter, Depends, Form, HTTPException[m
[31m-from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm[m
[31m-from pony.orm import db_session, select[m
[31m-[m
[31m-from ..Models import SuccessT, User[m
[31m-[m
[31m-[m
[31m-# Util[m
[31m-def hash_password(passwd: str) -> str:[m
[31m-    return hashpw(passwd, gensalt())[m
[31m-[m
[31m-[m
[31m-router = APIRouter([m
[31m-    prefix="/auth", tags=["Auth"], responses={404: {"Description": "Not found"}}[m
[31m-)[m
[31m-[m
[31m-[m
[31m-@router.post("/register", response_model=SuccessT)[m
[31m-@db_session[m
[31m-def register_user(username: str = Form(), password: str = Form()):[m
[31m-    # Check if user already exists[m
[31m-    existing_user = select(u for u in User if u.username == username)[:][m
[31m-    if len(existing_user) != 0:[m
[31m-        raise HTTPException(status_code=400, detail="Username already exists")[m
[31m-    if len(password.strip()) == 0:[m
[31m-        raise HTTPException(status_code=400, detail="Password not set")[m
[31m-[m
[31m-    User([m
[31m-        username=username,[m
[31m-        password=hash_password(password.encode("utf-8")).decode("utf-8"),[m
[31m-    )[m
[31m-    return {"success": True}[m
[31m-[m
[31m-[m
[31m-class LoginRespT(SuccessT):[m
[31m-    access_token: str | None[m
[31m-    token_type: str | None[m
[31m-[m
[31m-[m
[31m-oauth2_scheme = OAuth2PasswordBearer(tokenUrl="auth/login")[m
[31m-[m
[31m-[m
[31m-@router.post("/login", response_model=LoginRespT)[m
[31m-@db_session()[m
[31m-def login(form_data: OAuth2PasswordRequestForm = Depends()):[m
[31m-    user = select(u for u in User if u.username == form_data.username)[:][m
[31m-    if len(user) == 0:[m
[31m-        raise HTTPException(status_code=400, detail="Incorrect username or password")[m
[31m-    user: User = user[0][m
[31m-    if not checkpw(form_data.password.encode("utf-8"), user.password.encode("utf-8")):[m
[31m-        raise HTTPException(status_code=400, detail="Incorrect username or password")[m
[31m-    with open(f"{dirname(__file__)}/../../jwtRS256.key", "r") as f:[m
[31m-        token = jwt.encode([m
[31m-            {[m
[31m-                "user_id": user.id,[m
[31m-                "is_sys_admin": True if user.sys_admin else False,[m
[31m-                "exp": datetime.now().timestamp() + 86400,[m
[31m-            },[m
[31m-            f.read(),[m
[31m-            algorithm="RS256",[m
[31m-        )[m
[31m-        return {"success": True, "access_token": token, "token_type": "bearer"}[m
[31m-[m
[31m-    # Some kind of error occoured[m
[31m-    return {"success": False, "access_token": None, "token_type": None}[m
[31m-[m
[31m-[m
[31m-class Mzn_instanceT(SuccessT):[m
[31m-    name: str[m
[31m-[m
[31m-[m
[31m-@router.post("/createMzn", response_model=Mzn_instanceT)[m
[31m-@db_session[m
[31m-def createMznInstance(form_mzn: Mzn_instanceT = Depends()):[m
[31m-    Mzn_instanceT([m
[31m-        name=form_mzn.name,[m
[31m-        description=form_mzn.description,[m
[31m-        mzn=form_mzn.mzn,[m
[31m-        dzn=form_mzn.dzn,[m
[31m-        user_id=form_mzn.user_id,[m
[31m-    )[m
[31m-    return {"success": True}[m
[32m+[m[32mfrom datetime import datetime[m[41m[m
[32m+[m[32mfrom os.path import dirname[m[41m[m
[32m+[m[41m[m
[32m+[m[32mimport jwt[m[41m[m
[32m+[m[32mfrom bcrypt import checkpw, gensalt, hashpw[m[41m[m
[32m+[m[32mfrom fastapi import APIRouter, Depends, Form, HTTPException[m[41m[m
[32m+[m[32mfrom fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm[m[41m[m
[32m+[m[32mfrom pony.orm import db_session, select[m[41m[m
[32m+[m[41m[m
[32m+[m[32mfrom ..Models import SuccessT, User[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32m# Util[m[41m[m
[32m+[m[32mdef hash_password(passwd: str) -> str:[m[41m[m
[32m+[m[32m    return hashpw(passwd, gensalt())[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mrouter = APIRouter([m[41m[m
[32m+[m[32m    prefix="/auth", tags=["Auth"], responses={404: {"Description": "Not found"}}[m[41m[m
[32m+[m[32m)[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32m@router.post("/register", response_model=SuccessT)[m[41m[m
[32m+[m[32m@db_session[m[41m[m
[32m+[m[32mdef register_user(username: str = Form(), password: str = Form()):[m[41m[m
[32m+[m[32m    """Registers a new user[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Args:[m[41m[m
[32m+[m[32m        username (str, optional): The username of the user..[m[41m[m
[32m+[m[32m        password (str, optional): The password of the user.[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Raises:[m[41m[m
[32m+[m[32m        HTTPException: Username already exists[m[41m[m
[32m+[m[32m        HTTPException: Passowrd not set[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Returns:[m[41m[m
[32m+[m[32m        dict: A simple dictionary with the property "success": true[m[41m[m
[32m+[m[32m    """[m[41m[m
[32m+[m[32m    # Check if user already exists[m[41m[m
[32m+[m[32m    existing_user = select(u for u in User if u.username == username)[:][m[41m[m
[32m+[m[32m    if len(existing_user) != 0:[m[41m[m
[32m+[m[32m        raise HTTPException(status_code=400, detail="Username already exists")[m[41m[m
[32m+[m[32m    if len(password.strip()) == 0:[m[41m[m
[32m+[m[32m        raise HTTPException(status_code=400, detail="Password not set")[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    User([m[41m[m
[32m+[m[32m        username=username,[m[41m[m
[32m+[m[32m        password=hash_password(password.encode("utf-8")).decode("utf-8"),[m[41m[m
[32m+[m[32m    )[m[41m[m
[32m+[m[32m    return {"success": True}[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass LoginRespT(SuccessT):[m[41m[m
[32m+[m[32m    access_token: str | None[m[41m[m
[32m+[m[32m    token_type: str | None[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32moauth2_scheme = OAuth2PasswordBearer(tokenUrl="auth/login")[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32m@router.post("/login", response_model=LoginRespT)[m[41m[m
[32m+[m[32m@db_session()[m[41m[m
[32m+[m[32mdef login(form_data: OAuth2PasswordRequestForm = Depends()):[m[41m[m
[32m+[m[32m    """Logs the user in[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Args:[m[41m[m
[32m+[m[32m        form_data (OAuth2PasswordRequestForm, optional): The form data,[m[41m[m
[32m+[m[32m        has username and password as properties.[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Raises:[m[41m[m
[32m+[m[32m        HTTPException: Incorrect username or password[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Returns:[m[41m[m
[32m+[m[32m        dict: A dictionary telling if the login attempt was successful, as well as an included[m[41m[m
[32m+[m[32m        access token and token_type[m[41m[m
[32m+[m[32m    """[m[41m[m
[32m+[m[32m    user = select(u for u in User if u.username == form_data.username)[:][m[41m[m
[32m+[m[32m    if len(user) == 0:[m[41m[m
[32m+[m[32m        raise HTTPException(status_code=400, detail="Incorrect username or password")[m[41m[m
[32m+[m[32m    user: User = user[0][m[41m[m
[32m+[m[32m    if not checkpw(form_data.password.encode("utf-8"), user.password.encode("utf-8")):[m[41m[m
[32m+[m[32m        raise HTTPException(status_code=400, detail="Incorrect username or password")[m[41m[m
[32m+[m[32m    try:[m[41m[m
[32m+[m[32m        with open(f"{dirname(__file__)}/../../jwtRS256.key", "r") as f:[m[41m[m
[32m+[m[32m            token = jwt.encode([m[41m[m
[32m+[m[32m                {[m[41m[m
[32m+[m[32m                    "user_id": user.id,[m[41m[m
[32m+[m[32m                    "is_sys_admin": True if user.sys_admin else False,[m[41m[m
[32m+[m[32m                    "exp": datetime.now().timestamp() + 86400,[m[41m[m
[32m+[m[32m                },[m[41m[m
[32m+[m[32m                f.read(),[m[41m[m
[32m+[m[32m                algorithm="RS256",[m[41m[m
[32m+[m[32m            )[m[41m[m
[32m+[m[32m            return {"success": True, "access_token": token, "token_type": "bearer"}[m[41m[m
[32m+[m[32m    except:[m[41m[m
[32m+[m[32m        pass[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    # Some kind of error occoured[m[41m[m
[32m+[m[32m    return {"success": False, "access_token": None, "token_type": None}[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass Mzn_instanceT(SuccessT):[m[41m[m
[32m+[m[32m    name: str[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32mclass Dzn_instanceT(SuccessT):[m[41m[m
[32m+[m[32m    name: str[m[41m[m
[1mdiff --git a/python_backend/app/routes/instances.py b/python_backend/app/routes/instances.py[m
[1mindex 6494818..cc913c0 100644[m
[1m--- a/python_backend/app/routes/instances.py[m
[1m+++ b/python_backend/app/routes/instances.py[m
[36m@@ -1,53 +1,183 @@[m
[31m-from typing import List[m
[31m-[m
[31m-from fastapi import APIRouter, Body, Depends, HTTPException, Query[m
[31m-from pony.orm import db_session[m
[31m-[m
[31m-from ..middleware.auth import get_current_user_id[m
[31m-from ..Models import Mzn_instance, Mzn_instanceT, SuccessT[m
[31m-[m
[31m-router = APIRouter([m
[31m-    prefix="/instances",[m
[31m-    tags=["Instances"],[m
[31m-    responses={[m
[31m-        404: {"Description": "Not found"},[m
[31m-        401: {"Description": "Access denied"},[m
[31m-    },[m
[31m-)[m
[31m-[m
[31m-[m
[31m-@router.get("/mzn", response_model=List[Mzn_instanceT])[m
[31m-@db_session[m
[31m-def get_mzn([m
[31m-    instance_ids: List[int] = Query(None), user_id: int = Depends(get_current_user_id)[m
[31m-):[m
[31m-    res = [][m
[31m-    for i in instance_ids:[m
[31m-        try:[m
[31m-            instance = Mzn_instance[i][m
[31m-        except:[m
[31m-            raise HTTPException(status_code=404, detail=f"Instance {i} not found")[m
[31m-        if instance.user.id != user_id:[m
[31m-            raise HTTPException(status_code=401, detail="Access denied")[m
[31m-        res.append(instance.to_dict(with_collections=True, with_lazy=True))[m
[31m-    return res[m
[31m-[m
[31m-[m
[31m-@router.post("/mzn/{instance_id}", response_model=SuccessT)[m
[31m-@db_session[m
[31m-def update_mzn([m
[31m-    instance_id: int,[m
[31m-    contents: str = Body(""),[m
[31m-    friendly_name: str = Body(""),[m
[31m-    user_id: int = Depends(get_current_user_id),[m
[31m-):[m
[31m-    try:[m
[31m-        instance = Mzn_instance[instance_id][m
[31m-    except:[m
[31m-        raise HTTPException(status_code=404, detail=f"Instance {instance_id} not found")[m
[31m-    if instance.user.id != user_id:[m
[31m-        raise HTTPException(status_code=401, detail="Access denied")[m
[31m-[m
[31m-    instance.contents = contents[m
[31m-    instance.friendly_name = friendly_name[m
[31m-    return {"success": True}[m
[32m+[m[32mfrom typing import List[m[41m[m
[32m+[m[41m[m
[32m+[m[32mfrom fastapi import APIRouter, Body, Depends, HTTPException, Query[m[41m[m
[32m+[m[32mfrom pony.orm import commit, db_session[m[41m[m
[32m+[m[41m[m
[32m+[m[32mfrom ..middleware.auth import get_current_user_id[m[41m[m
[32m+[m[32mfrom ..Models import Dzn_instance, Dzn_instanceT, Mzn_instance, Mzn_instanceT, SuccessT[m[41m[m
[32m+[m[41m[m
[32m+[m[32mrouter = APIRouter([m[41m[m
[32m+[m[32m    prefix="/instances",[m[41m[m
[32m+[m[32m    tags=["Instances"],[m[41m[m
[32m+[m[32m    responses={[m[41m[m
[32m+[m[32m        404: {"Description": "Not found"},[m[41m[m
[32m+[m[32m        401: {"Description": "Access denied"},[m[41m[m
[32m+[m[32m    },[m[41m[m
[32m+[m[32m)[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32m@router.get("/mzn", response_model=List[Mzn_instanceT])[m[41m[m
[32m+[m[32m@db_session[m[41m[m
[32m+[m[32mdef get_mzn([m[41m[m
[32m+[m[32m    instance_ids: List[int] = Query(None), user_id: int = Depends(get_current_user_id)[m[41m[m
[32m+[m[32m):[m[41m[m
[32m+[m[32m    """Fetches mzn instances from the database given a list of IDs[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Args:[m[41m[m
[32m+[m[32m        instance_ids (List[int], optional): A list of instance ids[m[41m[m
[32m+[m[32m        user_id (int, optional): The user_id of the currently logged in user[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Raises:[m[41m[m
[32m+[m[32m        HTTPException: Instance not found[m[41m[m
[32m+[m[32m        HTTPException: Access denied[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Returns:[m[41m[m
[32m+[m[32m        List[Mzn_InstanceT]: A list of mzn instances[m[41m[m
[32m+[m[32m    """[m[41m[m
[32m+[m[32m    res = [][m[41m[m
[32m+[m[32m    for i in instance_ids:[m[41m[m
[32m+[m[32m        try:[m[41m[m
[32m+[m[32m            instance = Mzn_instance[i][m[41m[m
[32m+[m[32m        except:[m[41m[m
[32m+[m[32m            raise HTTPException(status_code=404, detail=f"Instance {i} not found")[m[41m[m
[32m+[m[32m        if instance.user.id != user_id:[m[41m[m
[32m+[m[32m            raise HTTPException(status_code=401, detail="Access denied")[m[41m[m
[32m+[m[32m        res.append(instance.to_dict(with_collections=True, with_lazy=True))[m[41m[m
[32m+[m[32m    return res[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32m@router.post("/mzn/{instance_id}", response_model=SuccessT)[m[41m[m
[32m+[m[32m@db_session[m[41m[m
[32m+[m[32mdef update_mzn([m[41m[m
[32m+[m[32m    instance_id: int,[m[41m[m
[32m+[m[32m    contents: str = Body(""),[m[41m[m
[32m+[m[32m    friendly_name: str = Body(""),[m[41m[m
[32m+[m[32m    user_id: int = Depends(get_current_user_id),[m[41m[m
[32m+[m[32m):[m[41m[m
[32m+[m[32m    """Updates an existing mzn instance[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Args:[m[41m[m
[32m+[m[32m        instance_id (int): The instance to update[m[41m[m
[32m+[m[32m        contents (str, optional): The new contents of the instance.[m[41m[m
[32m+[m[32m        friendly_name (str, optional): The new name of the instance[m[41m[m
[32m+[m[32m        user_id (int, optional): The user_id of the currently logged in user[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Raises:[m[41m[m
[32m+[m[32m        HTTPException: Instance not found[m[41m[m
[32m+[m[32m        HTTPException: Access denied[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Returns:[m[41m[m
[32m+[m[32m        dict: A success flag in a dictionary[m[41m[m
[32m+[m[32m    """[m[41m[m
[32m+[m[32m    try:[m[41m[m
[32m+[m[32m        instance = Mzn_instance[instance_id][m[41m[m
[32m+[m[32m    except:[m[41m[m
[32m+[m[32m        raise HTTPException(status_code=404, detail=f"Instance {instance_id} not found")[m[41m[m
[32m+[m[32m    if instance.user.id != user_id:[m[41m[m
[32m+[m[32m        raise HTTPException(status_code=401, detail="Access denied")[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    instance.contents = contents[m[41m[m
[32m+[m[32m    instance.friendly_name = friendly_name[m[41m[m
[32m+[m[32m    return {"success": True}[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32m@router.post("/create_mzn", response_model=Mzn_instanceT)[m[41m[m
[32m+[m[32m@db_session[m[41m[m
[32m+[m[32mdef create_mzn(contents: str = Body(""), user_id: int = Depends(get_current_user_id)):[m[41m[m
[32m+[m[32m    """Creates a new mzn instance in the database[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Args:[m[41m[m
[32m+[m[32m        contents (str, optional): The initial contents of the of the mzn instance[m[41m[m
[32m+[m[32m        user_id (int, optional): The user_id of the currently logged in user[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Returns:[m[41m[m
[32m+[m[32m        Mzn_InstanceT: The created instance[m[41m[m
[32m+[m[32m    """[m[41m[m
[32m+[m[32m    instance = Mzn_instance(user=user_id, contents=contents)[m[41m[m
[32m+[m[32m    commit()  # Save the instance so we can get the ID[m[41m[m
[32m+[m[32m    instance.friendly_name = f"mzn_{instance.id}"[m[41m[m
[32m+[m[32m    return instance.to_dict(with_collections=True, with_lazy=True)[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32m# region Dzn[m[41m[m
[32m+[m[32m@router.get("/dzn", response_model=List[Dzn_instanceT])[m[41m[m
[32m+[m[32m@db_session[m[41m[m
[32m+[m[32mdef get_dzn([m[41m[m
[32m+[m[32m    instance_ids: List[int] = Query(None), user_id: int = Depends(get_current_user_id)[m[41m[m
[32m+[m[32m):[m[41m[m
[32m+[m[32m    """Fetches dzn instances from the database given a list of IDs[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Args:[m[41m[m
[32m+[m[32m        instance_ids (List[int], optional): A list of instance ids[m[41m[m
[32m+[m[32m        user_id (int, optional): The user_id of the currently logged in user[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Raises:[m[41m[m
[32m+[m[32m        HTTPException: Instance not found[m[41m[m
[32m+[m[32m        HTTPException: Access denied[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Returns:[m[41m[m
[32m+[m[32m        List[Dzn_InstanceT]: A list of dzn instances[m[41m[m
[32m+[m[32m    """[m[41m[m
[32m+[m[32m    res = [][m[41m[m
[32m+[m[32m    for i in instance_ids:[m[41m[m
[32m+[m[32m        try:[m[41m[m
[32m+[m[32m            instance = Dzn_instance[i][m[41m[m
[32m+[m[32m        except:[m[41m[m
[32m+[m[32m            raise HTTPException(status_code=404, detail=f"Instance {i} not found")[m[41m[m
[32m+[m[32m        if instance.user.id != user_id:[m[41m[m
[32m+[m[32m            raise HTTPException(status_code=401, detail="Access denied")[m[41m[m
[32m+[m[32m        res.append(instance.to_dict(with_collections=True, with_lazy=True))[m[41m[m
[32m+[m[32m    return res[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32m@router.post("/dzn/{instance_id}", response_model=SuccessT)[m[41m[m
[32m+[m[32m@db_session[m[41m[m
[32m+[m[32mdef update_dzn([m[41m[m
[32m+[m[32m    instance_id: int,[m[41m[m
[32m+[m[32m    contents: str = Body(""),[m[41m[m
[32m+[m[32m    friendly_name: str = Body(""),[m[41m[m
[32m+[m[32m    user_id: int = Depends(get_current_user_id),[m[41m[m
[32m+[m[32m):[m[41m[m
[32m+[m[32m    """Updates an existing dzn instance[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Args:[m[41m[m
[32m+[m[32m        instance_id (int): The instance to update[m[41m[m
[32m+[m[32m        contents (str, optional): The new contents of the instance.[m[41m[m
[32m+[m[32m        friendly_name (str, optional): The new name of the instance[m[41m[m
[32m+[m[32m        user_id (int, optional): The user_id of the currently logged in user[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Raises:[m[41m[m
[32m+[m[32m        HTTPException: Instance not found[m[41m[m
[32m+[m[32m        HTTPException: Access denied[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Returns:[m[41m[m
[32m+[m[32m        dict: A success flag in a dictionary[m[41m[m
[32m+[m[32m    """[m[41m[m
[32m+[m[32m    try:[m[41m[m
[32m+[m[32m        instance = Dzn_instance[instance_id][m[41m[m
[32m+[m[32m    except:[m[41m[m
[32m+[m[32m        raise HTTPException(status_code=404, detail=f"Instance {instance_id} not found")[m[41m[m
[32m+[m[32m    if instance.user.id != user_id:[m[41m[m
[32m+[m[32m        raise HTTPException(status_code=401, detail="Access denied")[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    instance.contents = contents[m[41m[m
[32m+[m[32m    instance.friendly_name = friendly_name[m[41m[m
[32m+[m[32m    return {"success": True}[m[41m[m
[32m+[m[41m[m
[32m+[m[41m[m
[32m+[m[32m@router.post("/create_dzn", response_model=Dzn_instanceT)[m[41m[m
[32m+[m[32m@db_session[m[41m[m
[32m+[m[32mdef create_dzn(contents: str = Body(""), user_id: int = Depends(get_current_user_id)):[m[41m[m
[32m+[m[32m    """Creates a new dzn instance in the database[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Args:[m[41m[m
[32m+[m[32m        contents (str, optional): The initial contents of the of the dzn instance[m[41m[m
[32m+[m[32m        user_id (int, optional): The user_id of the currently logged in user[m[41m[m
[32m+[m[41m[m
[32m+[m[32m    Returns:[m[41m[m
[32m+[m[32m        Dzn_InstanceT: The created instance[m[41m[m
[32m+[m[32m    """[m[41m[m
[32m+[m[32m    instance = Dzn_instance(user=user_id, contents=contents)[m[41m[m
[32m+[m[32m    commit()  # Save the instance so we can get the ID[m[41m[m
[32m+[m[32m    instance.friendly_name = f"dzn_{instance.id}"[m[41m[m
[32m+[m[32m    return instance.to_dict(with_collections=True, with_lazy=True)[m[41m[m
[1mdiff --git a/python_backend/app/routes/users.py b/python_backend/app/routes/users.py[m
[1mindex 33c95c6..660a4c2 100644[m
[1m--- a/python_backend/app/routes/users.py[m
[1m+++ b/python_backend/app/routes/users.py[m
[36m@@ -12,5 +12,13 @@[m [mrouter = APIRouter([m
 @router.get("/get", response_model=UserT)[m
 @db_session[m
 def get_self_user(user_id: int = Depends(get_current_user_id)):[m
[32m+[m[32m    """Fetches data on the currently logged in user[m
[32m+[m
[32m+[m[32m    Args:[m
[32m+[m[32m        user_id (int, optional): The user_id of the currently logged in user[m
[32m+[m
[32m+[m[32m    Returns:[m
[32m+[m[32m        UserT: The user object[m
[32m+[m[32m    """[m
     user = User[user_id][m
     return user.to_dict(with_collections=True)[m
[1mdiff --git a/python_backend/requirements.txt b/python_backend/requirements.txt[m
[1mindex dd2e693..2597085 100644[m
[1m--- a/python_backend/requirements.txt[m
[1m+++ b/python_backend/requirements.txt[m
[36m@@ -1,4 +1,3 @@[m
[31m-mysqlclient[m
 pyOpenSSL==22.1.0[m
 uvicorn[standard][m
 fastapi[m
[36m@@ -6,4 +5,4 @@[m [mbcrypt[m
 python-multipart[m
 pony[m
 pyjwt[m
[31m-python-dotenv[m
\ No newline at end of file[m
[32m+[m[32mpython-dotenv[m
