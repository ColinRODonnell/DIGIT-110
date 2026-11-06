
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    queryBinding="xslt2">
    <pattern id="location-geocoding">
        <!-- Southern and East Hemis - CRO -->
        <rule context="location">
            <assert test="not(contains(., 'AU')) or
                (number(@long) &gt; 100 and
                number(@long) &gt; 0 and
                number(@lat) &lt; 0)">
            </assert>
        </rule>
        <!-- Nothern and West Hemis - CRO -->
        <rule context="location">
            <assert test="not(contains(., 'USA')) or
                (number(@long) &lt; 0 and
                number(@lat) &gt; 0)">
            </assert>
        </rule>
    </pattern>
</schema>
