local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("if", {
        t("if "), i(1, "condition"), t({ "; then", "\t" }),
        i(2, "# body"),
        t({ "", "fi" }),
    }),

    s("ife", {
        t("if "), i(1, "condition"), t({ "; then", "\t" }),
        i(2, "# body"),
        t({ "", "else", "\t" }),
        i(3, "# else body"),
        t({ "", "fi" }),
    }),

    s("for", {
        t("for "), i(1, "item"), t(" in "), i(2, "list"), t({ "; do", "\t" }),
        i(3, "# body"),
        t({ "", "done" }),
    }),

    s("while", {
        t("while "), i(1, "condition"), t({ "; do", "\t" }),
        i(2, "# body"),
        t({ "", "done" }),
    }),

    s("fn", {
        i(1, "function_name"), t({ "() {", "\t" }),
        i(2, "# body"),
        t({ "", "}" }),
    }),

    s("case", {
        t("case "), i(1, "$var"), t({ " in", "\t" }),
        i(2, "pattern"), t({ ")", "\t\t" }),
        i(3, "# body"),
        t({ "", "\t\t;;", "\tesac" }),
    }),

    s("qa", {
        t("https://"), i(1, "qa.cloud-dev.infini-ai.com:9443"), t("/maas/v1/chat/completions"),
    }),

    s("localhost", {
        t("http://localhost:"), i(1, "9998"), t("/maas/v1/chat/completions"),
    }),

    s("apikey", {
        t("--header \"Authorization: Bearer "), i(1, "$PAASTEST_API_KEY"), t("\""),
    }),

    s("curl-body", {
        t({ "--data '{",
            "  \"model\": \"" }), i(1, "mock-model-if-dispatchter"), t({ "\",",
            "  \"messages\": [",
            "    {\"role\": \"user\", \"content\": \"" }), i(2, "who are you"), t({ "\"}",
            "  ],",
            "  \"stream\": true",
            "}'" }),
    })
}
