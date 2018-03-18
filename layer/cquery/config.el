(defvar cquery-project-whitelist nil
  "A list of project directory patterns for which cquery should be
initialized. This overrides `cquery-project-blacklist'.")

(defvar cquery-project-blacklist nil
  "A list of project root patterns for which cquery shouldn't be
initialized. `cquery-project-whitelist' is checked first, then this,
if no pattern matches the project root, cquery will be initialized.")

(setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack" :completion (:detailedLabel t)))

