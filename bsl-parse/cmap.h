//
//  cmap.h
//  loader
//
//  Created by Samantha Marshall on 2/19/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#ifndef loader_cmap_h
#define loader_cmap_h

#include <sys/types.h>
#include <stdlib.h>

typedef void *cmap;
typedef void *cmap_str;

#if __cplusplus
extern "C" {
#endif

	extern __attribute__((visibility("default"))) cmap cmap_new(void);
	extern __attribute__((visibility("default"))) void cmap_free(cmap *amap);
	extern __attribute__((visibility("default"))) void *cmap_objectForKey(cmap *amap, void *key);
	extern __attribute__((visibility("default"))) void cmap_setObjectForKey(cmap *amap, void *key, void *value);
	extern __attribute__((visibility("default")))size_t cmap_count(cmap *amap);

	extern __attribute__((visibility("default"))) cmap_str cmap_str_new(void);
	extern __attribute__((visibility("default"))) void cmap_str_free(cmap_str *amap);
	extern __attribute__((visibility("default"))) void *cmap_str_objectForKey(cmap_str *amap, const char *key);
	extern __attribute__((visibility("default"))) void cmap_str_setObjectForKey(cmap_str *amap, const char *key, void *value);
	extern __attribute__((visibility("default"))) size_t cmap_str_count(cmap_str *amap);

#if __cplusplus
};
#endif

#endif
