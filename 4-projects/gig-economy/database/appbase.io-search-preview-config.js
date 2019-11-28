let data = {
    "analytics": true,
    "default": {
        "list-1": {
            "dataField": "release_year",
            "size": 100,
            "title": "year1",
            "sortBy": "asc"
        },
        "list-2": {
            "dataField": "genres",
            "queryFormat": "or",
            "showCheckbox": false,
            "size": 100
        },
        "result": {
            "dataField": "_score",
            "metaFields": {
                "description": "overview",
                "image": "poster_path",
                "title": "original_title",
                "url": ""
            }
        },
        "search": {
            "dataField": ["genres", "original_language", "original_title", "tagline"],
            "fieldWeights": [1, 1, 3, 2],
            "fuzziness": 0,
            "highlight": true,
            "placeholder": "search-placeholder",
            "queryFormat": "and",
            "title": "search-title"
        }
    }
};