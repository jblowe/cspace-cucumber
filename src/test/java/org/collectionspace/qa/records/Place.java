package org.collectionspace.qa.records;

public class Place extends Record {

    public Place(){

        requiredMap.put("csc-placeAuthority-termDisplayName", "No place like Home");

        fieldSelectorByLabel.put("Abbreviation", "csc-placeAuthority-nameAbbrev");
        fieldSelectorByLabel.put("Broader Context", "csc-hierarchy-broaderContext");
        fieldSelectorByLabel.put("Broader object type", "csc-hierarchy-broaderContextType");
        fieldSelectorByLabel.put("Coordinate system", "csc-place-vCoordSys");
        fieldSelectorByLabel.put("Date", "csc-placeGeoRefGroup-geoRefDateGroup");
        fieldSelectorByLabel.put("Date", "csc-placeOwnerGroup-ownershipDateGroup");
        fieldSelectorByLabel.put("Date", "csc-placeTermGroup-nameDateGroup");
        fieldSelectorByLabel.put("Datum", "csc-place-geodeticDatum");
        fieldSelectorByLabel.put("Decimal latitude", "csc-place-decimalLatitude");
        fieldSelectorByLabel.put("Decimal longitude", "csc-place-decimalLongitude");
        fieldSelectorByLabel.put("Depth", "csc-place-vDepth");
        fieldSelectorByLabel.put("Display Name", "csc-placeAuthority-termDisplayName");
        fieldSelectorByLabel.put("Distance above surface", "csc-place-vDistanceAboveSurface");
        fieldSelectorByLabel.put("Elevation", "csc-place-vElevation");
        fieldSelectorByLabel.put("Equivalent Context", "csc-hierarchy-equivalentContexts");
        fieldSelectorByLabel.put("Footprint SRS", "csc-place-footprintSRS");
        fieldSelectorByLabel.put("Footprint WKT", "csc-place-footprintWKT");
        fieldSelectorByLabel.put("Footprint sp. fit", "csc-place-footprintSpatialFit");
        fieldSelectorByLabel.put("Formatted Display Name", "csc-placeAuthority-termFormattedDisplayName");
        fieldSelectorByLabel.put("Georeference Information", "csc-place-geoReferenceInformation");
        fieldSelectorByLabel.put("Georeference place name", "csc-place-geoRefPlaceName");
        fieldSelectorByLabel.put("Georeferenced by", "csc-place-geoReferencedBy");
        fieldSelectorByLabel.put("Historical status", "csc-placeAuthority-historicalStatus");
        fieldSelectorByLabel.put("Language", "csc-placeAuthority-termLanguage");
        fieldSelectorByLabel.put("Locality Information", "csc-place-localityInformation");
        fieldSelectorByLabel.put("Max depth (m)", "csc-place-maxDepthInMeters");
        fieldSelectorByLabel.put("Max distance above surface (m)", "csc-place-maxDistanceAboveSurfaceInMeters");
        fieldSelectorByLabel.put("Max elevation (m)", "csc-place-maxElevationInMeters");
        fieldSelectorByLabel.put("Min depth (m)", "csc-place-minDepthInMeters");
        fieldSelectorByLabel.put("Min distance above surface (m)", "csc-place-minDistanceAboveSurfaceInMeters");
        fieldSelectorByLabel.put("Min elevation (m)", "csc-place-minElevationInMeters");
        fieldSelectorByLabel.put("Name", "csc-placeAuthority-termName");
        fieldSelectorByLabel.put("Narrower Context", "csc-hierarchy-narrowerContext");
        fieldSelectorByLabel.put("Note", "csc-place-ownershipNote");
        fieldSelectorByLabel.put("Note", "csc-placeAuthority-nameNote");
        fieldSelectorByLabel.put("Object component type", "csc-hierarchy-narrowerContextType");
        fieldSelectorByLabel.put("Owner", "csc-place-owner");
        fieldSelectorByLabel.put("Place Authority", "csc-place-placeAuthorityInformation");
        fieldSelectorByLabel.put("Place Record Type", "csc-place-placeType");
        fieldSelectorByLabel.put("Place Term Group(s)", "csc-place-placeAuthority");
        fieldSelectorByLabel.put("Place note", "csc-place-placeNote");
        fieldSelectorByLabel.put("Place owners", "csc-place-placeOwnerGroup");
        fieldSelectorByLabel.put("Place source", "csc-place-placeSource");
        fieldSelectorByLabel.put("Precision", "csc-place-coordPrecision");
        fieldSelectorByLabel.put("Pref for lang", "csc-placeAuthority-termPrefForLang");
        fieldSelectorByLabel.put("Protocol", "csc-place-geoRefProtocol");
        fieldSelectorByLabel.put("Pt. radius sp. fit", "csc-place-pointRadiusSpatialFit");
        fieldSelectorByLabel.put("Qualifier", "csc-placeAuthority-termQualifier");
        fieldSelectorByLabel.put("Related Term", "csc-hierarchy-relatedTerms");
        fieldSelectorByLabel.put("Remarks", "csc-place-geoRefRemarks");
        fieldSelectorByLabel.put("Source", "csc-place-geoRefSource");
        fieldSelectorByLabel.put("Source", "csc-place-vCoordSource");
        fieldSelectorByLabel.put("Source", "csc-placeAuthority-termSource");
        fieldSelectorByLabel.put("Source ID", "csc-placeAuthority-termSourceID");
        fieldSelectorByLabel.put("Source detail", "csc-place-vCoordSourceRefId");
        fieldSelectorByLabel.put("Source detail", "csc-placeAuthority-termSourceDetail");
        fieldSelectorByLabel.put("Source note", "csc-placeAuthority-termSourceNote");
        fieldSelectorByLabel.put("Spatial ref system", "csc-place-vSpatialReferenceSystem");
        fieldSelectorByLabel.put("Status", "csc-placeAuthority-termStatus");
        fieldSelectorByLabel.put("Term Flag", "csc-placeAuthority-termFlag");
        fieldSelectorByLabel.put("Type", "csc-placeAuthority-termType");
        fieldSelectorByLabel.put("Uncertainty", "csc-place-coordUncertaintyInMeters");
        fieldSelectorByLabel.put("Unit of measure", "csc-place-vUnitofMeasure");
        fieldSelectorByLabel.put("Verbatim coords", "csc-place-vCoordinates");
        fieldSelectorByLabel.put("Verbatim latitude", "csc-place-vLatitude");
        fieldSelectorByLabel.put("Verbatim longitude", "csc-place-vLongitude");
        fieldSelectorByLabel.put("Verification", "csc-place-geoRefVerificationStatus");

        // Entries above with duplicate text labels, to be checked by a human.
        //
        // Some may represent labels for headers above repeatable fields/groups.
        // Duplicate text label: Date (appears 3 times)
        // Duplicate text label: Note (appears 2 times)
        // Duplicate text label: Source (appears 3 times)
        // Duplicate text label: Source detail (appears 2 times)

        // Messagekeys in the 'uispec' file not matched by text labels
        // in the message bundles file (e.g. 'core-messages.properties').
        //
        // Some of these may be record metadata that is never displayed
        // in the UI. If so, they can be added to the script's stoplist.
        //
        // In other instances, these may represent messagekeys for section
        // headers in the record, rather than for fields.
        //
        // Finally, these may represent sub-records (e.g. Contact in
        // Person and Organization) or other sub-data structures.
        //
        // Not found: text label for message key 'hierarchy-domaindataLabel'
        // Not found: text label for message key 'hierarchy-equivalentContextLabel'
        // Not found: text label for message key 'hierarchy-equivalentInformationLabel'
        // Not found: text label for message key 'hierarchy-hierarchyInformationLabel'
        // Not found: text label for message key 'hierarchy-narrowerContextsLabel'
        // Not found: text label for message key 'hierarchy-relatedTermLabel'
        // Not found: text label for message key 'place-placeGeoRefGroupLabel'
        // Not found: text label for message key 'place-placeIDLabel'
        // Not found: text label for message key 'placeAuthority-placeTermGroupLabel'
        // Not found: text label for message key 'placeAuthority-termInformationLabel'

        // ----- End of entries generated by an automated script -----

    }
}
