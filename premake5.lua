workspace "Engine"

	architecture "x64"
	configurations {

		"Debug",
		"Release",
		"Dist"	
	}


project "Engine"

	location "Engine"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}")
	objdir ("bin-int/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}")

	files{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs {
		"Engine/vendor/spdlog/include"
	}

	filter "system:windows"
  
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines{
			"E_PLATFORM_WINDOWS",
			"E_BUILD_DLL"
		}

		postbuildcommands{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/Sandbox")
		}


	filter "configurations:Debug"

		defines "E_DEBUG"
		symbols "On"
	
	filter "configurations:Release"

		defines "E_RELEASE" 
		symbols "On"

	filter "configurations:Dist"

		defines "E_DIST"
		symbols "On"



project "Sandbox"

	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}")
	objdir ("bin-int/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}")

	files{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs {

		"Engine/vendor/spdlog/include",
		"Engine/src"
	}

	links{

		"Engine"
	}

	filter "system:windows"
  
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines{

			"E_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"

		defines "E_DEBUG"
		symbols "On"
	
	filter "configurations:Release"

		defines "E_RELEASE"
		symbols "On"

	filter "configurations:Dist"

		defines "E_DIST"
		symbols "On"