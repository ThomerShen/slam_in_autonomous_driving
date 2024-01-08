#ifndef GNSS_H
#define GNSS_H

#include "eigen_types.h"
#include "message_def.h"

namespace sad {

enum class GpsStatusType
{
    GNSS_FLOAT_SOLUTION = 5,         // 浮点解（cm到dm之间）
    GNSS_FIXED_SOLUTION = 4,         // 固定解（cm级）
    GNSS_PSEUDO_SOLUTION = 2,        // 伪距差分解（分米级）
    GNSS_SINGLE_POINT_SOLUTION = 1,  // 单点解（10m级）
    GNSS_NOT_EXIST = 0,              // GPS无信号
    GNSS_OTHER = -1,                 // 其他
};

struct UTMCoordinate {
    UTMCoordinate() = default;
    explicit UTMCoordinate(int zone, const Vec2d& xy = Vec2d::Zero(), bool north = true);

};
}
#endif // GNSS_H
