/**
 * OpenAPI Petstore
 * This spec is mainly for testing Petstore server and contains fake endpoints, models. Please do not use this for any other purpose. Special characters: \" \\
 *
 * The version of the OpenAPI document: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by OpenAPI-Generator 7.2.0-SNAPSHOT.
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

/*
 * MapTest.h
 *
 * 
 */

#ifndef MapTest_H_
#define MapTest_H_



#include <string>
#include <map>
#include <memory>
#include <vector>
#include <array>
#include <boost/property_tree/ptree.hpp>
#include "helpers.h"

namespace org {
namespace openapitools {
namespace server {
namespace model {

/// <summary>
/// 
/// </summary>
class  MapTest 
{
public:
    MapTest() = default;
    explicit MapTest(boost::property_tree::ptree const& pt);
    virtual ~MapTest() = default;

    MapTest(const MapTest& other) = default; // copy constructor
    MapTest(MapTest&& other) noexcept = default; // move constructor

    MapTest& operator=(const MapTest& other) = default; // copy assignment
    MapTest& operator=(MapTest&& other) noexcept = default; // move assignment

    std::string toJsonString(bool prettyJson = false) const;
    void fromJsonString(std::string const& jsonString);
    boost::property_tree::ptree toPropertyTree() const;
    void fromPropertyTree(boost::property_tree::ptree const& pt);


    /////////////////////////////////////////////
    /// MapTest members

    /// <summary>
    /// 
    /// </summary>
    std::map<std::string, std::map<std::string, std::string>> getMapMapOfString() const;
    void setMapMapOfString(std::map<std::string, std::map<std::string, std::string>> value);

    /// <summary>
    /// 
    /// </summary>
    std::map<std::string, std::string> getMapOfEnumString() const;
    void setMapOfEnumString(std::map<std::string, std::string> value);

    /// <summary>
    /// 
    /// </summary>
    std::map<std::string, bool> getDirectMap() const;
    void setDirectMap(std::map<std::string, bool> value);

    /// <summary>
    /// 
    /// </summary>
    std::map<std::string, bool> getIndirectMap() const;
    void setIndirectMap(std::map<std::string, bool> value);

protected:
    std::map<std::string, std::map<std::string, std::string>> m_Map_map_of_string;
    std::map<std::string, std::string> m_Map_of_enum_string;
    std::map<std::string, bool> m_Direct_map;
    std::map<std::string, bool> m_Indirect_map;
};

std::vector<MapTest> createMapTestVectorFromJsonString(const std::string& json);

template<>
inline boost::property_tree::ptree toPt<MapTest>(const MapTest& val) {
    return val.toPropertyTree();
}

template<>
inline MapTest fromPt<MapTest>(const boost::property_tree::ptree& pt) {
    MapTest ret;
    ret.fromPropertyTree(pt);
    return ret;
}

}
}
}
}

#endif /* MapTest_H_ */
