// A test fiile for basic libevent functions
#include <event.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char**argv) {
    struct event_config *cfg;
	struct event_base *base;
	enum event_method_feature f;
    cfg = event_config_new();

	const char **methods = event_get_supported_methods();
	printf("Starting Libevent %s.  Available methods are:\n",
		event_get_version());
	for (int i=0; methods[i] != NULL; ++i) {
		printf("    %s\n", methods[i]);
	}

	event_config_set_flag(cfg, EVENT_BASE_FLAG_NOLOCK);
	event_config_avoid_method(cfg, "select");
	event_config_avoid_method(cfg, "poll");
	base = event_base_new_with_config(cfg);
	
	printf("Using Libevent with backend method %s.",
        event_base_get_method(base));
    f = event_base_get_features(base);
    if ((f & EV_FEATURE_ET))
        printf("  Edge-triggered events are supported.");
    if ((f & EV_FEATURE_O1))
        printf("  O(1) event notification is supported.");
    if ((f & EV_FEATURE_FDS))
        printf("  All FD types are supported.");
    puts("");
    return 0;
}
