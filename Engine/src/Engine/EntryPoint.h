#pragma once


#ifdef E_PLATFORM_WINDOWS

extern Engine::Application* Engine::CreateApplication();

int main(int argc, char** argv) {

	Engine::Log::Init();

	E_CORE_WARN("Initialized Log!");
	E_INFO("Hello! Var={0}", 10);

	auto app = Engine::CreateApplication();
	app->Run();
	delete app;
}

#endif
