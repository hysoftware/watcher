#pragma once
#include <loader/category.h>
#include <QString>
#include <random>
namespace plugin {
    class topic;
}
class QNetworkAccessManager;
class QNetworkReply;
namespace yotsuba {
    class category : public plugin::category {
        Q_OBJECT
        friend class root;

       public:
        category(std::mt19937 *mt, QNetworkAccessManager *manager,
                 QObject *parent = nullptr);
       public
    slots:
        void get_boards();
        void setWorkSafe(const bool ws);
       private
    slots:
        void getDataFinished(QNetworkReply *reply);

       private:
        bool _ws;
        std::mt19937 *_mt;
        QNetworkAccessManager *_accessmanager;
    };
}
