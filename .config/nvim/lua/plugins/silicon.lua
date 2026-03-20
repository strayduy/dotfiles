return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    main = "nvim-silicon",
    opts = {
        line_offset = function(args)
            return args.line1
        end,

        output = function()
            return "~/Desktop/" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. "_code.png"
        end,
    },
}
