local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
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
