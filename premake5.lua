project "ImGui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir("bin/"..outputdir.."/%{prj.name}")
    objdir("bin/"..outputdir.."/%{prj.name}/int")

    files {
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        "imgui_demo.cpp",

        "backends/imgui_impl_sdlrenderer2.h",
        "backends/imgui_impl_sdlrenderer2.cpp",
        "backends/imgui_impl_sdl2.h",
        "backends/imgui_impl_sdl2.cpp"
    }

    includedirs {
        "%{prj.location}",
        "%{IncludeDir.SDL2}"
    }

    filter "system:windows"
        systemversion "latest"

    filter "system:linux"
        pic "On"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
        symbols "off"
